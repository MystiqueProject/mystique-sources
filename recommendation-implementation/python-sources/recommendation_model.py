import os
import math
import numpy as np
from tqdm import tqdm
from datetime import datetime
import keras
from keras.models import Sequential
from keras.layers import Embedding, Dense, Flatten, Dropout
from keras.losses import categorical_crossentropy

from dataset_utilities import dataset_utils as data


# Reference: https://keras.io/guides/writing_your_own_callbacks/
class CustomLearningRateScheduler(keras.callbacks.Callback):
    """Learning rate scheduler which sets the learning rate according to schedule.

  Arguments:
      schedule: a function that takes an epoch index
          (integer, indexed from 0) and current learning rate
          as inputs and returns a new learning rate as output (float).
  """

    def __init__(self, learning_rate):
        super(CustomLearningRateScheduler, self).__init__()
        self.lr = learning_rate
        self.patience = 3
        self.dissapointment = 0
        self.lower_rate = False
        self.curr_loss = 10
        self.last_delta = 0.0000001

    def on_epoch_begin(self, epoch, logs=None):
        if not hasattr(self.model.optimizer, "lr"):
            raise ValueError('Optimizer must have a "lr" attribute.')

        # Get the current learning rate from model's optimizer.
        lr = float(keras.backend.get_value(self.model.optimizer.learning_rate))
        if self.lower_rate:
            self.lr = lr * 0.1
            self.lower_rate = False
            print("\nEpoch %05d: Learning rate is %1.9f." % (epoch, self.lr))

        # Set the value back to the optimizer before this epoch starts
        keras.backend.set_value(self.model.optimizer.lr, self.lr)
        #print("\nEpoch %05d: Learning rate is %6.4f." % (epoch, self.lr))

    def on_epoch_end(self, epoch, logs=None):
        self.last_loss = self.curr_loss
        self.curr_loss = logs.get('loss')

        delta = self.last_loss - self.curr_loss
        if delta < (0.1 * self.last_delta):
            self.dissapointment += 1
        else:
            self.dissapointment -= 1
            self.dissapointment = max(0, self.dissapointment)

        print("\n Patience: " +str(self.patience) + " Dissapointment: " + str(self.dissapointment))

        if self.dissapointment >= self.patience:    # Smoothen out to avoid edge cases
            self.lower_rate = True
            self.dissapointment = 0

        self.last_delta = delta


class mysarchitect:
    def __init__(self):

        # Data Attributes
        self.dataset_obj = data()
        self.X_test_np = np.zeros(1)
        self.Y_test_np = np.zeros(1)
        self.Y_test_np_one_hot = np.zeros(1)
        self.X_train_np = np.zeros(1)
        self.Y_train_np = np.zeros(1)

        # Learning parameters
        self.init_learning_rate = 0.0001
        self.train_epochs = 20
        self.train_batch_size = 32
        self.validation_split = 0.1

        # Model parameters
        self.num_input_features = 3
        self.vocab_size = 10 ** 4 + 1
        self.embedding_size = 32
        self.deep_layer_dim = 256
        self.output_vec_length = 285

        # Objects
        self.model = Sequential()

    def set_model_params(self,
                         num_input_features = 3,
                         vocab_size = (10 ** 4 + 1),
                         embedding_size = 32,
                         deep_layer_dim = 256,
                         output_vec_length = 285
                         ):
        self.num_input_features = num_input_features
        self.vocab_size = vocab_size
        self.embedding_size = embedding_size
        self.deep_layer_dim = deep_layer_dim
        self.output_vec_length = output_vec_length

    def set_training_params(self, init_lr=0.0001, epochs=10):
        self.init_learning_rate = init_lr
        self.train_epochs = epochs

    def build_model(self):
        self.model.add(Embedding(self.vocab_size, self.embedding_size, input_length=self.num_input_features))
        self.model.add(Flatten())
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dropout(0.1))
        self.model.add(Dense(self.output_vec_length, activation='softmax'))

        self.model.compile( loss=categorical_crossentropy,
                            optimizer='adam',
                            metrics=['accuracy'])

        self.print_model_summary()

    def build_mlp_model(self):
        self.model.add(Dense(self.deep_layer_dim, input_shape=(3,), activation='relu'))
        self.model.add(Flatten())
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dense(self.deep_layer_dim, activation='relu'))
        self.model.add(Dropout(0.1))
        self.model.add(Dense(self.output_vec_length, activation='softmax'))

        self.model.compile( loss=categorical_crossentropy,
                            optimizer='adam',
                            metrics=['accuracy'])

        self.print_model_summary()

    def train_model(self):
        logdir = "tboard_logs/scalars/" + datetime.now().strftime("%Y%m%d-%H%M%S")
        tensorboard_callback = keras.callbacks.TensorBoard(log_dir=logdir)

        lr_callback = CustomLearningRateScheduler(self.init_learning_rate)

        self.model.fit(
                        self.X_train_np,
                        self.Y_train_np,
                        epochs=self.train_epochs, batch_size=self.train_batch_size, validation_split=self.validation_split,
                        callbacks=[tensorboard_callback, lr_callback])

    def test_model(self, test_log_filename, save_logs=True):
        print('Evaluating on test set:')
        loss, accuracy = self.model.evaluate(self.X_test_np, self.Y_test_np_one_hot)
        print('')

        if save_logs:
            print('Generating evaluation logs:')

            total_datapoints = self.X_test_np.shape[0]
            xdims = self.X_test_np.shape[1]
            inference_batch_size = 32
            num_inference_batches = math.ceil(total_datapoints / inference_batch_size)
            hit = 0

            ofile = open(test_log_filename, 'w')

            header = ','.join([' X[' + str(idx) + ']' for idx in range(xdims)])
            header += ',,Y,,Y_label,\n'
            ofile.write(header)

            start_idx = 0
            end_idx = min((start_idx + inference_batch_size), total_datapoints)
            for _ in tqdm(range(num_inference_batches)):
                num_points_this_batch = end_idx - start_idx
                x = self.X_test_np[start_idx:end_idx]
                y = self.model.predict(x, batch_size=num_points_this_batch)

                for i in range(num_points_this_batch):
                    elem = y[i]
                    elem_vec = list(elem)
                    max_of_elem = max(elem_vec)
                    idx_of_max = elem_vec.index(max_of_elem)

                    global_idx = start_idx + i
                    if idx_of_max == self.Y_test_np[global_idx][0]:
                        hit += 1

                    log = ','.join([str(dval) for dval in x[i]])
                    log += ',, ' + str(idx_of_max)
                    log += ',, ' + str(self.Y_test_np[global_idx][0]) + ',\n'
                    ofile.write(log)

                start_idx += num_points_this_batch
                end_idx = min((start_idx + inference_batch_size), total_datapoints)

            acc = 100 * hit / total_datapoints
            log = 'Observed ACC: ' + str(acc) + '\n'
            ofile.write(log)

            ofile.close()

    def save_model(self, model_filename):
        self.model.save(model_filename, save_format='h5')

    def load_model(self):
        print("WIP")

    def print_model_summary(self):
        print(self.model.summary())

    def read_dataset(self, dataset_csv_file):
        self.dataset_obj.read_dataset_from_file(filename=dataset_csv_file, set_num_categories=self.output_vec_length)

        # All the operations on data should be handled by the dataset obj class
        self.X_train_np, self.Y_train_np = self.dataset_obj.get_training_data_with_one_hot_labels()
        self.X_test_np, self.Y_test_np, self.Y_test_np_one_hot = self.dataset_obj.get_test_data()

    def run_end_to_end(self, dataset_csv_file, run_prefix='mysarchitect'):
        model_filename = run_prefix + '_model.h5'
        testlog_filename = run_prefix + '_testlog.csv'

        self.read_dataset(dataset_csv_file)
        self.build_model()
        #self.build_mlp_model()
        self.train_model()
        self.save_model(model_filename)
        self.test_model(save_logs=True, test_log_filename=testlog_filename)



if __name__ == '__main__':
    #os.environ["CUDA_VISIBLE_DEVICES"] = "0"

    #dataset_csv_file = "./datasets/dataset_2e12_Macs.csv"
    dataset_csv_file = "../GeneratedData/datasets/expanded/dataset_2e14_Macs_new_cost.csv"
    mys = mysarchitect()
    mys.set_model_params(deep_layer_dim=256 ,output_vec_length=858)
    mys.set_training_params(epochs=20)
    mys.run_end_to_end(dataset_csv_file, run_prefix='mysarchitect_20ep_2e12macs')
    #mys.build_mlp_model()
