import numpy as np
import math as m 
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
class Bicycle():
    def __init__(self):
        self.xc=0
        self.yc=0
        self.theta=0
        self.delta=0
        self.beta=0

        self.l=2
        self.lr=1.2
        self.w_max=1.22
        self.sample_time=0.01

    def reset(self):
        self.xc=0
        self.yc=0
        self.theta=0
        self.delta=0
        self.beta=0

class Bicycle(Bicycle):
    def step(self,v,w):
        self.xc = self.xc + v * np.cos(self.theta + self.beta) * self.sample_time
        self.yc = self.yc + v * np.sin(self.theta + self.beta) * self.sample_time
        self.theta = self.theta + ((v * np.cos(self.beta) * np.tan(self.delta))/self.l) * self.sample_time
        self.delta = self.delta + w * self.sample_time
        self.beta = np.arctan((self.lr / self.l) * np.tan(self.delta))
        
       

radius=8
sample_time=0.01
time_end=30
model=Bicycle()
model.reset()

t_data=np.arange(0,time_end,sample_time)
x_data=np.zeros_like(t_data)
y_data=np.zeros_like(t_data)
v_data=np.zeros_like(t_data)
w_data=np.zeros_like(t_data)

n=t_data.shape[0]
#delta=0.993 * np.arctan(model.l / radius)

v_data[:] = 4 * np.pi * radius/time_end
model.xc=0
model.yc=0

for i in range(n):
    max_delta = 0.996 * m.atan2(model.l, radius)
    x_data[i] = model.xc
    y_data[i] = model.yc
    if i < n/8 and model.delta < max_delta:
        w_data[i] = model.w_max
    elif n/8 < i < 5*n/8 and model.delta > -max_delta:
        w_data[i] = -model.w_max
    elif i > 5*n/8 and model.delta < max_delta:
        w_data[i] = model.w_max
    model.step(v_data[i], w_data[i])
        
plt.axis('equal')
plt.plot(x_data,y_data)
plt.show()



