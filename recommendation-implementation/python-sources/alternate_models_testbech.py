import matplotlib.pyplot as plt

from airchitect.scikit_models.xgboost_classifier_model import XGBoostClassifier
from airchitect.scikit_models.support_vector_classifier_model import SupportVectorClassifier
from airchitect.keras_model.feed_forward_mlp import FeedForwardMLP
from dataset_utilities import dataset_utils


def test_xgboost():
    dataset_loc = '../GeneratedData/datasets/expanded'
    #dataset_loc = '.'
    dataset_filename = dataset_loc + '/dataset_2e14_Macs_new_cost.csv'

    config_loc = '../GeneratedData/configs'
    #config_loc = '.'
    config_filename = config_loc + '/Configs_2e14_Macs_new_cost.csv'

    datautil = dataset_utils()
    datautil.read_dataset_from_file(filename=dataset_filename)

    datautil.read_config_from_file(filename=config_filename, case=0)

    xdata, ydata = datautil.get_training_data()

    # Working on reduced data
    num_datapoints = xdata.shape[0]
    max_data = 5 * 10 ** 6

    if num_datapoints > max_data:
        xdata = xdata[:max_data, :]
        ydata = ydata[:max_data, :]

    train_frac = 0.9
    num_train_data = int(train_frac * xdata.shape[0])

    xtrain = xdata[:num_train_data, :]
    ytrain = ydata[:num_train_data, :]

    xtest = xdata[num_train_data:, :]
    ytest = ydata[num_train_data:, :]

    #
    model = XGBoostClassifier()
    model.set_params(True)
    model.create_model()
    model.fit_data(xtrain, ytrain)

    predicted_y = model.predict(xtest)

    num_points = 0
    num_correct = 0
    for label, pred_label in zip(ytest, predicted_y):
        label = label[0]

        if label == pred_label:
            num_correct += 1

        num_points += 1

    accuracy = 100 * num_correct / num_points
    acc_log = 'Accuracy = ' + str(accuracy) + '%'
    print(acc_log)

    save_predictions = True
    if save_predictions:
        resfile = open('mys_xgb_pred_results.csv', 'w')
        resfile.write(acc_log + '\n')

        for query, label, pred_label in zip(xtest, ytest, predicted_y):
            log = str(list(query)) + ',,' + str(label[0]) + ',,' + str(pred_label)
            #print(log)
            resfile.write(log + '\n')

        resfile.close()


def test_svc():
    dataset_loc = '/home/anand/project-local-repos/' \
                  '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                  'GeneratedData/datasets/expanded'
    dataset_filename = dataset_loc + '/dataset_2e14_Macs_new_cost.csv'

    config_loc = '/home/anand/project-local-repos/' \
                 '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                 'GeneratedData/configs'
    config_filename = config_loc + '/Configs_2e14_Macs_new_cost.csv'

    datautil = dataset_utils()
    datautil.read_dataset_from_file(filename=dataset_filename)

    datautil.read_config_from_file(filename=config_filename, case=0)

    xdata, ydata = datautil.get_training_data()

    # Working on reduced data
    num_datapoints = xdata.shape[0]
    max_data = 5 * 10 ** 5

    if num_datapoints > max_data:
        xdata = xdata[:max_data, :]
        ydata = ydata[:max_data, :]

    train_frac = 0.9
    num_train_data = int(train_frac * xdata.shape[0])

    xtrain = xdata[:num_train_data, :]
    ytrain = ydata[:num_train_data, :]

    xtest = xdata[num_train_data:, :]
    ytest = ydata[num_train_data:, :]

    #
    model = SupportVectorClassifier()
    kernel = 'linear'
    model.set_params(verbose=True, kernel=kernel)
    model.create_model()
    model.fit_data(xtrain, ytrain)

    predicted_y = model.predict(xtest)

    num_points = 0
    num_correct = 0
    for label, pred_label in zip(ytest, predicted_y):
        label = label[0]

        if label == pred_label:
            num_correct += 1

        num_points += 1

    accuracy = 100 * num_correct / num_points
    acc_log = 'Accuracy = ' + str(accuracy) + '%'
    print(acc_log)

    save_predictions = True
    if save_predictions:
        filename = 'mys_SVC_' + kernel + '_pred_results.csv'
        resfile = open(filename, 'w')
        resfile.write(acc_log + '\n')

        for query, label, pred_label in zip(xtest, ytest, predicted_y):
            log = str(list(query)) + ',,' + str(label[0]) + ',,' + str(pred_label)
            #print(log)
            resfile.write(log + '\n')

        resfile.close()


def test_MLP():
    dataset_loc = '/home/anand/project-local-repos/' \
                  '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                  'GeneratedData/datasets/expanded'
    dataset_filename = dataset_loc + '/dataset_2e14_Macs_new_cost.csv'

    config_loc = '/home/anand/project-local-repos/' \
                 '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                 'GeneratedData/configs'
    config_filename = config_loc + '/Configs_2e14_Macs_new_cost.csv'

    datautil = dataset_utils()
    datautil.read_dataset_from_file(filename=dataset_filename)

    datautil.read_config_from_file(filename=config_filename, case=0)

    xdata, ydata = datautil.get_training_data()
    num_outputs = datautil.num_categories

    # Working on reduced data
    num_datapoints = xdata.shape[0]
    max_data = 5 * 10 ** 6

    if num_datapoints > max_data:
        xdata = xdata[:max_data, :]
        ydata = ydata[:max_data, :]

    train_frac = 0.9
    num_train_data = int(train_frac * xdata.shape[0])

    xtrain = xdata[:num_train_data, :]
    ytrain = ydata[:num_train_data, :]

    xtest = xdata[num_train_data:, :]
    ytest = ydata[num_train_data:, :]

    #
    hidden_layer_list = [128]
    model = FeedForwardMLP()
    model.set_params(verbose=True, num_output_categories=num_outputs,
                     num_input_features=3, hidden_nodes_list=hidden_layer_list)
    epochs = 30
    model.set_training_params(train_epochs=epochs)
    model.build_model()
    model.train_model(xtrain, ytrain)

    predicted_y = model.get_predictions(xtest)

    num_points = 0
    num_correct = 0
    for label, pred_label in zip(ytest, predicted_y):
        label = label[0]

        if label == pred_label:
            num_correct += 1

        num_points += 1

    accuracy = 100 * num_correct / num_points
    acc_log = 'Accuracy = ' + str(accuracy) + '%'
    print(acc_log)

    save_predictions = True
    if save_predictions:
        hidden_layer_str = '_'.join([str(a) for a in hidden_layer_list])
        filename = 'mys_mlp_' + hidden_layer_str + '_ep' + str(epochs) + '_pred_results.csv'
        resfile = open(filename, 'w')
        resfile.write(acc_log + '\n')

        for query, label, pred_label in zip(xtest, ytest, predicted_y):
            log = str(list(query)) + ',,' + str(label[0]) + ',,' + str(pred_label[0])
            #print(log)
            resfile.write(log + '\n')

        resfile.close()

def get_one_label_to_predicted_distribution(filename='', num_classes=459):
    label_frequency_distribution = [0] * num_classes
    predicted_frequency_distribution = [0] * num_classes

    predictions_file = open(filename, 'r')
    first = True

    for row in predictions_file:
        if first:
            first = False
            continue

        elems = row.strip().split(',,')
        label_val = int(elems[1])
        pred_val = int(elems[2])

        label_frequency_distribution[label_val] += 1
        predicted_frequency_distribution[pred_val] += 1

    return label_frequency_distribution, predicted_frequency_distribution


def plot_label_to_predicted_distribution_one(num_classes=858,
                                             filename='',
                                             save=True,
                                             save_filename='xgb_delta_distribution.csv',
                                             plot=True):
    #filename = './predicted_results/xgboost/mys_xgb_pred_results.csv'
    #filename = './predicted_results/xgb_experiment_pred_results.csv'
    #filename = './predicted_results/mlp/mys_mlp_256_256_ep30_pred_results.csv'
    num_classes = 450

    label_distr, pred_distr = get_one_label_to_predicted_distribution(filename=filename,
                                                                      num_classes=num_classes)

    x = [a for a in range(len(label_distr))]
    #x1 = [a - 0.2 for a in x]
    #plt.bar(x1[:300], label_distr[:300], width=0.4, label='Ground truth')

    #x2 = [a + 0.2 for a in x]
    #plt.bar(x2[:300], pred_distr[:300], width=0.4, label='Predicted')

    diff = [a -b for a, b in zip(label_distr, pred_distr)]

    if save:
        delta_distr_file = open(save_filename, 'w')
        for d in diff:
            log = str(d) + ',\n'
            delta_distr_file.write(log)
        delta_distr_file.close()

    if plot:
        max_idx = num_classes
        plt.bar(x[:max_idx], diff[:max_idx], label='diff')

        plt.legend()
        #plt.yscale('log', base=10)
        plt.show()


if __name__ == '__main__':
    #test_MLP()
    test_xgboost()
    #test_svc()

    filename = './predicted_results/xgboost/mys_xgb_pred_results.csv'
    plot_label_to_predicted_distribution_one(filename=filename, num_classes=858,
                                             save=True, save_filename='xgboost_diff.csv',
                                             plot=True)
