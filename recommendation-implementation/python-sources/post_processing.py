from dataset_utilities import dataset_utils as data
import matplotlib.pyplot as plt
import math


def analyze_mispredictions(log_filename):
    # Read the file

    # For each entry determine if misprediction

    # Assess the degree of misprediction
    # Num parts mispredicted ?
    # Part Aspect ratio mispredicted ?
    # Arr row and col mispredicted ?
    # Dataflow misprediced ?

    # Calculate the runtime of golden and mispredicted labels
    # Normalize the delta wrt actual runtime to see the impact
    # Report and plot
    plot_mismatches = False
    plot_norm_performance = True

    first = True
    data_obj = data()
    stored_configs = "../GeneratedData/configs/Configs_2e14_Macs_new_cost.csv"

    num_elem = 0
    mispred  = 0

    mismatch_parts = 0
    mismatch_part_aspect = 0
    mismatch_arr_aspect = 0
    mismatch_df = 0

    mismatched_runtime_diff_vec = []
    normalized_mismatched_runtime_diff_vec = []
    normalized_performance_vec = []

    mispred_file = open(log_filename, 'r')
    data_obj.read_config_from_file(case=0, filename=stored_configs)

    for row in mispred_file:
        if first:
            first=False
            continue

        if row[0] == 'O':       # Observed ACC: XX line
            continue

        elems = row.strip().split(',')[:-1]

        label = int(elems[-1].strip())
        pred = int(elems[-3].strip())
        num_elem += 1

        if not label == pred:
            mispred += 1

            lR, lC, lPr, lPc, lDf = data_obj.get_category_vector_by_id(label)
            pR, pC, pPr, pPc, pDf = data_obj.get_category_vector_by_id(pred)

            lParts = lPr * lPc
            pParts = pPr * pPc

            if not lParts == pParts:
                mismatch_parts += 1

            if lParts == pParts and (not lPr == pPr):
                mismatch_part_aspect += 1

            lMac = lR * lC
            pMac = pR * pC

            if lMac == pMac and (not lR == pR):
                mismatch_arr_aspect += 1

            if not lDf == pDf:
                mismatch_df += 1

            M = int(elems[0])
            N = int(elems[1])
            K = int(elems[2])

            pRuntime = data_obj.get_analytical_runtime_for_category_id(pred, M, N, K)
            lRuntime = data_obj.get_analytical_runtime_for_category_id(label, M, N, K)

            delta = abs(pRuntime - lRuntime)
            norm_delta_perc = delta / lRuntime * 100

            norm_performance = (lRuntime / pRuntime)   # Performance is calculated as inverse of runtime

            mismatched_runtime_diff_vec.append(delta)
            normalized_mismatched_runtime_diff_vec.append(norm_delta_perc)
            normalized_performance_vec.append(norm_performance)

    avg_delta = sum(mismatched_runtime_diff_vec) / len(mismatched_runtime_diff_vec)
    avg_norm_delta = sum(normalized_mismatched_runtime_diff_vec) / len(normalized_mismatched_runtime_diff_vec)

    prec_mispred = mispred / num_elem * 100

    log = 'Misredictions= ' + str(mispred) + ' of ' + str(num_elem) + ' [ ' + '{:04.2f}'.format(prec_mispred) + ' %] '
    print(log)

    log = 'Avg runtime diff: ' + str(avg_delta) + ', Normalized: ' + '{:04.2f}'.format(avg_norm_delta) + ' %'
    print(log)

    log  = 'Parts  mismatch: ' + str(mismatch_parts) +',\n'
    log += 'Part aspect mismatch: ' + str(mismatch_part_aspect) +',\n'
    log += 'Arr aspect mismatch: ' + str(mismatch_arr_aspect) + ',\n'
    log += 'Dataflow mismatch: ' + str(mismatch_df)
    print(log)

    if plot_mismatches:
        mismatches = [x for x in range(len(normalized_mismatched_runtime_diff_vec))]
        log_mismatches_norm = []
        for x in normalized_mismatched_runtime_diff_vec:
            if not x == 0:
                val = math.log(x,10)
            else:
                val = x
            log_mismatches_norm.append(val)

        plt.bar(x=mismatches,height=normalized_mismatched_runtime_diff_vec)
        plt.ylim(0,300)
        plt.xlabel('Samples mispredicted')
        plt.ylabel('% difference runtime wrt best')
        #plt.bar(x=mismatches,height=log_mismatches_norm)
        plt.show()

    if plot_norm_performance:
        sorted_norm_performance = normalized_performance_vec
        sorted_norm_performance.sort()

        plt.plot(sorted_norm_performance)
        plt.show()


if __name__ == '__main__':
    test_log = "../GeneratedData/prediction_vs_testlabels_log/mysarchitect_20ep_2e14macs_testlog.csv"
    analyze_mispredictions(test_log)

