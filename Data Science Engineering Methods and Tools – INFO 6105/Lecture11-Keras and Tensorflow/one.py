import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import math

sns.set_style('whitegrid') 
sns.set_context('talk')

n_points = 200
x = np.linspace(0, 2, n_points) 
y = np.array([0] * int(n_points / 2) + list(x[:int(n_points / 2)])) * 2

plt.figure(figsize=(5, 2)) 
plt.plot(x, y, linewidth=2) 
plt.title('ridiculously simple data') 
plt.xlabel('a') 
plt.ylabel('b') 
plt.show()
import pdb;pdb.set_trace()


from keras.models import Sequential
from keras.layers.core import Dense, Activation
import numpy as np

np.random.seed(0) 
model = Sequential() 
model.add(Dense(output_dim=1, input_dim=1, init="normal")) 
model.add(Activation("relu")) 
model.compile(loss='mean_squared_error', optimizer='sgd')

# print initial weigths 
weights = model.layers[0].get_weights() 
w0 = weights[0][0][0] 
w1 = weights[1][0] 
print('neural net initialized with weigths w0: {w0:.2f}, w1: {w1:.2f}'.format(**locals())) 
pdb.set_trace()


print("test if stop")

from keras.callbacks import Callback
class TrainingHistory(Callback):
    def on_train_begin(self, logs={}):
        self.losses = []
        self.predictions = []
        self.i = 0
        self.save_every = 50
    def on_batch_end(self, batch, logs={}):
        self.losses.append(logs.get('loss'))
        self.i += 1
        if self.i % self.save_every == 0:
            pred = model.predict(X_train)
            self.predictions.append(pred)

history = TrainingHistory() 
pdb.set_trace()

X_train = np.array(x, ndmin=2).T
Y_train = np.array(y, ndmin=2).T 
model.fit(X_train,Y_train, nb_epoch=2000, verbose=0, callbacks=[history])
# print trained weights 
weights = model.layers[0].get_weights() 
w0 = weights[0][0][0] 
w1 = weights[1][0] 
print('neural net weights after training w0: {w0:.2f}, w1: {w1:.2f}'.format(**locals())) 
pdb.set_trace()

# save the animation
import matplotlib.animation as animation
fig = plt.figure(figsize=(5, 2.5)) 
plt.plot(x, y, label='data')
line, = plt.plot(x, history.predictions[0], label='prediction') 
plt.legend(loc='upper left')
def update_line(num):
    plt.title('iteration: {0}'.format((history.save_every * (num + 1))))
    line.set_xdata(x)
    line.set_ydata(history.predictions[num])
    return []
ani = animation.FuncAnimation(fig, update_line, len(history.predictions),interval=50, blit=True) 
ani.save('videos/neuron.mp4', fps=30, extra_args=['-vcodec', 'libx264', '-pix_fmt','yuv420p']) 
plt.close()
plt.figure(figsize=(5, 2.5)) 
plt.plot(x, y, label='data') 
plt.plot(x, history.predictions[0], label='prediction') 
plt.legend(loc='upper left') 
plt.title('iteration: 0') 
plt.savefig('images/neuron_start.png') 
plt.close()
plt.figure(figsize=(6, 3)) 
plt.plot(history.losses) 
plt.ylabel('error') 
plt.xlabel('iteration') 
plt.title('training error') 
plt.show() 

pdb.set_trace()


history = TrainingHistory() 
model = Sequential() 
model.add(Dense(output_dim=1, input_dim=1, init="normal")) 
model.add(Activation("relu")) 
model.compile(loss='mean_squared_error', optimizer='sgd') 
model.fit(X_train,Y_train, batch_size=200, nb_epoch=2000, verbose=0, callbacks=[history])
plt.figure(figsize=(6, 3)) 
plt.plot(history.losses) 
plt.ylabel('error') 
plt.xlabel('iteration') 
plt.title('training error') 
plt.show() 

pdb.set_trace()


hnp.random.seed(2) 
history = TrainingHistory() 
model = Sequential() 
model.add(Dense(output_dim=1, input_dim=1, init="normal")) 
model.add(Activation("relu")) 
model.compile(loss='mean_squared_error', optimizer='sgd')
weights = model.layers[0].get_weights() 
w0 = weights[0][0][0] 
w1 = weights[1][0] 
print('neural net initialized with weigths w0: {w0:.2f}, w1: {w1:.2f}'.format(**locals())) 
model.fit(X_train,Y_train,batch_size=200, nb_epoch=2000, verbose=0, callbacks=[history])

weights = model.layers[0].get_weights() 
w0 = weights[0][0][0] 
w1 = weights[1][0] 
print('neural net weigths after training w0: {w0:.2f}, w1: {w1:.2f}'.format(**locals()))
fig = plt.figure(figsize=(5, 2.5)) 
plt.plot(x, y, label='data')
line, = plt.plot(x, history.predictions[0], label='prediction') 
plt.xlabel('a') 
plt.ylabel('b') 
plt.legend(loc='upper left')
plt.figure(figsize=(5, 2.5)) 
plt.plot(history.losses) 
plt.ylabel('error') 
plt.xlabel('iteration') 
plt.title('training error') 
plt.show()

# Part 1
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import math
sns.set_style('whitegrid') 
sns.set_context('talk')
np.random.seed(0) 
x = np.linspace(0, 2 * math.pi, 200) 
sine = np.sin(x) 
err = np.random.normal(0, 0.2, len(sine)) 
y = sine + err 
plt.figure(figsize=(5, 3)) 
plt.plot(x, y) 
plt.xlim([0, 2 * math.pi]) 
plt.title('A noise sine') 
plt.show()

import pdb;pdb.set_trace()

# Part 2
from keras.models import Sequential
from keras.layers.core import Dense, Activation
n_conn = 60 
model = Sequential() 
model.add(Dense(output_dim=n_conn, input_dim=1)) 
model.add(Activation("relu")) 
model.add(Dense(output_dim=1)) 
model.compile(loss='mean_squared_error', optimizer='sgd') 
pdb.set_trace()

# Part 3
from keras.callbacks import Callback
class TrainingHistory(Callback):
    def on_train_begin(self, logs={}):
        self.losses = [] 
        self.predictions = [] 
        self.i = 0
        self.save_every = 50
    def on_batch_end(self, batch, logs={}):
        self.losses.append(logs.get('loss')) 
        self.i += 1
        if self.i % self.save_every == 0:
            pred = model.predict(X_train)
            self.predictions.append(pred)
X_train = np.array(x, ndmin=2).T
Y_train = np.array(y, ndmin=2).T 
pdb.set_trace()

# Part 4 
history = TrainingHistory()
res = model.fit(X_train,Y_train, nb_epoch=5000, verbose=0, callbacks=[history]) 
pdb.set_trace()