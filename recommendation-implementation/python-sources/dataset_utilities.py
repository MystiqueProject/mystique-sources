import math
import random
import numpy as np
from tqdm import tqdm
#import matplotlib.pyplot as plt

#
def getFactorsAsPairs(num):
    factor_list = []
    end = math.floor(math.sqrt(num))

    for i in range(end):
        i += 1

        if num % i == 0:
            a = int(i)
            b = int(num / i)

            factor_list.append([a, b])

    reverse_factor_list = []
    list_len = len(factor_list)

    # Reverse the list to get all the ordered pairs
    for i in range(list_len):
        j = list_len - i - 1

        val = factor_list[j]
        new_val = [val[1], val[0]]
        if not val[0] == val[1]:
            reverse_factor_list.append(new_val)

    factor_list += reverse_factor_list

    return factor_list


class dataset_utils:
    def __init__(self):
        self.num_mac = 2 ** 14
        self.min_dim = 4
        self.max_val = 10 ** 4

        self.frac_test = 0.1
        self.num_samples = 10 ** 6
        self.max_val = 10 ** 4
        self.numX = 1
        self.numY = 1

        self.all_categories = []
        self.num_categories= 1

        self.unified_dataset = np.zeros(1)

        self.X_data_all = np.zeros(1)
        self.Y_data_all = np.zeros(1)

        self.X_data_train = np.zeros(1)
        self.Y_data_train = np.zeros(1)
        self.Y_data_one_hot_train = np.zeros(1)

        self.X_data_test = np.zeros(1)
        self.Y_data_test = np.zeros(1)
        self.Y_data_one_hot_test = np.zeros(1)

    def set_arch_params(self, num_mac=2**14, min_dim=4):
        self.num_mac = num_mac
        self.min_dim = min_dim

    def set_dataset_params(self, frac_test=0.1, num_samples=10**6, max_val = 10 ** 4):
        self.frac_test = frac_test
        self.num_samples = num_samples
        self.max_val = max_val

    def gen_dataset(self, case=0, df=0):
        if case == 0:   # This refers to the all datalflow case
           self.gen_dataset_all_dataflow_opt()

        elif case == 1:
            self.gen_dataset_one_dataflow_opt(df=df)

    def gen_dataset_all_dataflow_opt(self):
        max_part = int(self.num_mac / self.min_dim)
        parts = max_part
        self.numX = 3
        self.numY = 1

        # generate all configs
        print('Generating configs')
        while not parts < 1:
            macPerArr = int(self.num_mac / parts)
            partVariations = getFactorsAsPairs(parts)

            for partRow, partCol in partVariations:
                arrVariations = getFactorsAsPairs(macPerArr)

                for row, col in arrVariations:
                    if (row%self.min_dim == 0) and col%self.min_dim == 0:
                        for df in range(3):
                            self.all_categories.append([row, col, partRow, partCol, df])

            parts = int(parts / 2)

        self.num_categories = len(self.all_categories)
        print(self.num_categories)

        dataset = []
        # Generate Lowest Runtime dataset
        print('Generating samples')
        for _ in tqdm(range(self.num_samples)):
            M = random.randint(1, self.max_val)
            N = random.randint(1, self.max_val)
            K = random.randint(1, self.max_val)

            bestClass = -1
            minRuntime = 10 ** 20
            runtimeArr = []

            classes = self.all_categories              # LAZY
            for cid in range(len(self.all_categories)):
                r = classes[cid][0]
                c = classes[cid][1]
                pr = classes[cid][2]
                pc = classes[cid][3]
                df = classes[cid][4]

                Srprime = 0
                Scprime = 0
                T = 0

                # Note in this project we do not want to divide along K dim as mystique does not have a mechanism to 
                # gather all the partial sums.
                # Instead in IS and WS we want to see if the time dimension can be further partitioned 
                if df == 0:
                    Srprime = math.ceil(M / pr)
                    Scprime = math.ceil(N / pc)
                    T = K
                elif df == 1:
                    Srprime = K
                    Scprime = math.ceil(N / pc)
                    T = math.ceil(M / pr)       # These are copies of the array which get separate elements of IFMAP but same elements of filter 
                elif df == 2:
                    Srprime = K
                    Scprime = math.ceil(M / pc)
                    T = math.ceil(N / pr)       # Similar to WS but instead of IFMAP filters get divided 

                rowFolds = math.ceil(Srprime / r)
                colFolds = math.ceil(Scprime / c)

                runtime = (2 * r + c + T - 2) * rowFolds * colFolds
                runtimeArr.append(runtime)  # To see if there are multiple entries with same min runtime

                if runtime < minRuntime:
                    minRuntime = runtime
                    bestClass = cid

            # We prioritize larger arrays for the sake of reuse
            for id in range(len(runtimeArr)):
                if runtimeArr[id] == minRuntime:
                    pr = classes[id][2]
                    pc = classes[id][3]

                    pr_golden = classes[bestClass][2]
                    pc_golden = classes[bestClass][3]

                    parts = pr * pc
                    parts_golden = pr_golden * pc_golden

                    if parts < parts_golden:
                        bestClass = id

            bestClass = int(bestClass)
            dataset.append([M, N, K, bestClass])

        self.unified_dataset = np.asarray(dataset)
        np.random.shuffle(self.unified_dataset)
        #self.balance_data()
        self.split_train_test()

    def gen_dataset_one_dataflow_opt(self,df=0):
        max_part = int(self.num_mac / self.min_dim)
        parts = max_part
        self.numX = 3
        self.numY = 1

        # generate all configs
        print('Generating configs')
        while not parts < 1:
            macPerArr = int(self.num_mac / parts)
            partVariations = getFactorsAsPairs(parts)

            for partRow, partCol in partVariations:
                arrVariations = getFactorsAsPairs(macPerArr)

                for row, col in arrVariations:
                    if (row / self.min_dim == 0) and col / self.min_dim == 0:
                        self.all_categories.append([row, col, partRow, partCol])

            parts = int(parts / 2)

        self.num_categories = len(self.all_categories)
        print(self.num_categories)

        dataset = []
        # Generate Lowest Runtime dataset
        print('Generating samples')
        for _ in tqdm(range(self.num_samples)):
            M = random.randint(1, self.max_val)
            N = random.randint(1, self.max_val)
            K = random.randint(1, self.max_val)

            bestClass = -1
            minRuntime = 10 ** 20
            runtimeArr = []

            classes = self.all_categories  # LAZY
            for cid in range(len(self.all_categories)):
                r = classes[cid][0]
                c = classes[cid][1]
                pr = classes[cid][2]
                pc = classes[cid][3]

                Sr = 0
                Sc = 0
                T = 0

                if df == 0:
                    Sr = M
                    Sc = N
                    T = K
                elif df == 1:
                    Sr = K
                    Sc = N
                    T = M
                elif df == 2:
                    Sr = K
                    Sc = M
                    T = N

                srPrime = math.ceil(Sr / pr)
                scPrime = math.ceil(Sc / pc)

                rowFolds = math.ceil(srPrime / r)
                colFolds = math.ceil(scPrime / c)

                runtime = (2 * r + c + T - 2) * rowFolds * colFolds
                runtimeArr.append(runtime)  # To see if there are multiple entries with same min runtime

                if runtime < minRuntime:
                    minRuntime = runtime
                    bestClass = cid

            # We prioritize larger arrays for the sake of reuse
            for id in range(len(runtimeArr)):
                if runtimeArr[id] == minRuntime:
                    pr = classes[id][2]
                    pc = classes[id][3]

                    pr_golden = classes[bestClass][2]
                    pc_golden = classes[bestClass][3]

                    parts = pr * pc
                    parts_golden = pr_golden * pc_golden

                    if parts < parts_golden:
                        bestClass = id

            bestClass = int(bestClass)
            dataset.append([Sr, Sc, df, bestClass])

        self.unified_dataset = np.asarray(dataset)
        np.random.shuffle(self.unified_dataset)
        #self.balance_data()
        self.split_train_test()

    def balance_data(self):
        counter_arr = np.zeros(self.num_categories)

        for data in self.unified_dataset:
            cat = int(data[-1])
            counter_arr[cat] += 1

        #plt.plot(counter_arr)
        #plt.show()

        min_val = self.num_samples
        for ctr in counter_arr:
            if 0 < ctr < min_val:       # Consider only non zero values
                min_val = ctr

        balanced_dataset = []
        counter_arr = np.zeros(self.num_categories)
        for data in self.unified_dataset:
            cat = int(data[-1])
            if not counter_arr[cat] > min_val:
                counter_arr[cat] += 1
                balanced_dataset.append(list(data))

        self.unified_dataset = np.asarray(balanced_dataset)
        self.num_samples = self.unified_dataset.shape[0]
        print('Samples after balancing: ' + str(self.num_samples))

        #print('Here')

    def split_train_test(self):
        num_test = math.floor(self.num_samples * self.frac_test)
        num_train = self.num_samples - num_test

        all_train_data = self.unified_dataset[:num_train]
        all_test_data = self.unified_dataset[num_train:]

        self.X_data_train = all_train_data[:,:self.numX]
        self.Y_data_train = all_train_data[:,self.numX:]
        print(num_train)
        print(self.num_categories)
        self.Y_data_one_hot_train = np.zeros((num_train, self.num_categories))

        for i in range(num_train):
            idx = int(self.Y_data_train[i])
            self.Y_data_one_hot_train[i][idx] = 1

        self.X_data_test = all_test_data[:, :self.numX]
        self.Y_data_test = all_test_data[:, self.numX:]
        self.Y_data_one_hot_test = np.zeros((num_test, self.num_categories))
        for i in range(num_test):
            idx = int(self.Y_data_test[i])
            self.Y_data_one_hot_test[i][idx] = 1

    def save_dataset_to_file(self, outfilename):
        np.savetxt(outfilename, self.unified_dataset, fmt='%s', delimiter=",")

        fh = open(outfilename, 'r+')
        prev_content = fh.read()
        fh.seek(0, 0)
        line = str(self.numX) + ', ' + str(self.numY) + ',\n'
        line += prev_content
        fh.write(line)
        fh.close()

        print('Dataset written to ' + outfilename)

    def read_dataset_from_file(self, filename, set_num_categories=0):
        first = True
        valid_elems = 0
        self.num_samples = 0
        dataset = []

        f = open(filename, 'r')

        for row in tqdm(f):
            if row == '':
                continue

            elems = row.strip().split(',')

            if first:
                 self.numX = int(elems[0])
                 self.numY = int(elems[1])
                 valid_elems = self.numX + self.numY
                 first = False
            else:
                elems = [int(x) for x in elems]
                assert not len(elems) < valid_elems, 'Incomplete row'
                dataset.append(elems[:valid_elems])
                self.num_samples += 1

        self.unified_dataset = np.asarray(dataset)
        np.random.shuffle(self.unified_dataset)

        if set_num_categories == 0:
            max_Y_val = max(self.unified_dataset[:,-1])
            self.num_categories = max_Y_val + 1
        else:
            self.num_categories = set_num_categories

        #self.balance_data()
        self.split_train_test()

    def save_configs_to_file(self, case=0, filename=''):

        f = open(filename, 'w')
        header = ''

        if case == 0:
            header = 'CatID, ArrRow, ArrCol, PartRow, PartCol, DataFlowID,\n'
        elif case == 1:
            header = 'CatID, ArrRow, ArrCol, PartRow, PartCol,\n'

        f.write(header)
        for id in range(len(self.all_categories)):
            log = str(id)
            log += ', ' + ', '.join([str(x) for x in self.all_categories[id]])
            log += ',\n'

            f.write(log)

        f.close()

    def read_config_from_file(self, case, filename):
        first = True
        f = open(filename, 'r')
        self.all_categories = []

        for row in tqdm(f):
            if first:
                first = False
                continue

            elems = row.strip().split(',')[:-1]
            elems = [int(x.strip()) for x in elems]

            this_vec = []
            if case == 0:
                this_vec = elems[1:6]
            elif case == 1:
                this_vec = elems[1:5]

            self.all_categories.append(this_vec)

        self.num_categories = len(self.all_categories)

    def get_category_vector_by_id(self, id):
        this_category_vector = self.all_categories[id]
        return this_category_vector

    def get_analytical_runtime_for_category_id(self, id, M, N, K):
        R, C, Pr, Pc, df = self.get_category_vector_by_id(id)

        if df == 0:
            Sr = M
            Sc = N
            T = K
        elif df == 1:
            Sr = K
            Sc = N
            T = M
        elif df == 2:
            Sr = K
            Sc = M
            T = N

        srPrime = math.ceil(Sr / Pr)
        scPrime = math.ceil(Sc / Pc)

        rowFolds = math.ceil(srPrime / R)
        colFolds = math.ceil(scPrime / C)

        runtime = (2 * R + C + T - 2) * rowFolds * colFolds

        return runtime


    def get_training_data_with_one_hot_labels(self):
        return self.X_data_train, self.Y_data_one_hot_train

    def get_training_data(self):
        return self.X_data_train, self.Y_data_train

    def get_test_data_with_one_hot_labels(self):
        return self.X_data_test, self.Y_data_one_hot_test

    def get_test_data(self):
        return self.X_data_test, self.Y_data_test, self.Y_data_one_hot_test


if __name__ == '__main__':
    pow = 14
    num_mac = 2 ** pow
    num_samples = 2 * 10 ** 6
    config_filename = 'Configs_2e' + str(pow) + '_Macs.csv'
    dataset_filename = 'dataset_2e' + str(pow) + '_Macs.csv'

    data_obj = dataset_utils()
    data_obj.set_arch_params(num_mac=num_mac)
    data_obj.set_dataset_params(num_samples=num_samples)
    data_obj.gen_dataset(case=0)
    data_obj.save_configs_to_file(case=0, filename=config_filename)
    data_obj.save_dataset_to_file(dataset_filename)
