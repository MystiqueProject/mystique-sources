from airchitect.scikit_models.xgboost_classifier_model import XGBoostClassifier
from airchitect.scikit_models.support_vector_classifier_model import SupportVectorClassifier
from airchitect.keras_model.feed_forward_mlp import FeedForwardMLP
from dataset_utilities import dataset_utils


def test_xgboost():
    dataset_loc = '/home/anand/project-local-repos/' \
                  '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                  'GeneratedData/datasets/expanded'
    dataset_filename = dataset_loc + '/dataset_2e14_Macs.csv'

    config_loc = '/home/anand/project-local-repos/' \
                 '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                 'GeneratedData/configs'
    config_filename = config_loc + '/Configs_2e14_Macs.csv'

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
    print('Accuracy = ' + str(accuracy) + '%')

    save_predictions = True
    if save_predictions:
        resfile = open('mys_xgb_pred_results.csv', 'w')

        for query, label, pred_label in zip(xtest, ytest, predicted_y):
            log = str(list(query)) + ',,' + str(label[0]) + ',,' + str(pred_label)
            #print(log)
            resfile.write(log + '\n')

        resfile.close()


def test_svc():
    dataset_loc = '/home/anand/project-local-repos/' \
                  '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                  'GeneratedData/datasets/expanded'
    dataset_filename = dataset_loc + '/dataset_2e14_Macs.csv'

    config_loc = '/home/anand/project-local-repos/' \
                 '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                 'GeneratedData/configs'
    config_filename = config_loc + '/Configs_2e14_Macs.csv'

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
    kernel = 'rbf'
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
    dataset_filename = dataset_loc + '/dataset_2e14_Macs.csv'

    config_loc = '/home/anand/project-local-repos/' \
                 '6.Mystique/1.Repositories/mystique-sources/recommendation-implementation/' \
                 'GeneratedData/configs'
    config_filename = config_loc + '/Configs_2e14_Macs.csv'

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
    hidden_layer_list = [128, 128]
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


if __name__ == '__main__':
    test_MLP()
    #test_xgboost()
    #test_svc()
