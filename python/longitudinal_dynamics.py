import numpy as np
import matplotlib.pyplot as plt 

class Vehicle():
    def __init__(self):        
        #Throttle to engine torque
        self.a_0 = 400
        self.a_1 = 0.1
        self.a_2 = -0.0002
        # Gear ratio, effective radius, mass + inertia
        self.GR = 0.35
        self.r_e = 0.3
        self.J_e = 10
        self.m = 2000
        self.g = 9.81
        # Aerodynamic and friction coefficients
        self.c_a = 1.36
        self.c_r1 = 0.01
        # Tire force 
        self.c = 10000
        self.F_max = 10000
        # State variables
        self.x = 0
        self.v = 5
        self.a = 0
        self.w_e = 100
        self.w_e_dot = 0
        
        self.sample_time = 0.01
        
    def reset(self):
        # reset state variables
        self.x = 0
        self.v = 5
        self.a = 0
        self.w_e = 100
        self.w_e_dot = 0
class Vehicle(Vehicle):
    def step(self, throttle, alpha):
        t_e =  throttle * (self.a_0 + self.a_1 * self.w_e + self.a_2 * self.w_e**2)   #engine torque
        f_aero= self.c_a *self.v **2                                                  #aerodynamic force
        r_x = self.c_r1 * self.v                                                      #rolling friction
        f_g = self.m * self.g *np.sin(alpha)                                          #force due to gradebility
        f_load = f_aero + r_x + f_g                                                   #total loading
        w_w = self.GR * self.w_e                                                      #wheel angular velocity
        s = w_w * self.r_e /self.v - 1                                            #slip ratio
        if abs(s) < 1:
            f_x = self.c * s
        else:
            f_x = self.F_max
        self.w_e_dot = (t_e - self.GR * self.r_e * f_load)/ self.J_e
        self.a = (f_x - f_load) / self.m

        self.w_e  += self.w_e_dot * self.sample_time          
        self.v += self.a * self.sample_time                                                  #v = at
        self.x +=  self.v * self.sample_time 
      



sample_time = 0.01
#time_end = 100
model = Vehicle()
#t_data = np.arange(0,time_end,sample_time)
#v_data = np.zeros_like(t_data)
# throttle percentage between 0 and 1
#throttle = 0.2
# incline angle (in radians)
#alpha = 0
#for i in range(t_data.shape[0]):
    #v_data[i] = model.v
    #model.step(throttle, alpha)
#plt.plot(t_data, v_data)
#plt.show()

time_end = 20
t_data = np.arange(0,time_end,sample_time)
x_data = np.zeros_like(t_data)
v_data = np.zeros_like(t_data)
w_e_data = np.zeros_like(t_data)

model.reset()
n = t_data.shape[0]


    
    
throttle = np.zeros_like(t_data)
alpha = np.zeros_like(t_data)


for i in range(n):
    x_data[i] = model.x
    v_data[i] = model.v
    if t_data[i] < 5:
        throttle[i] = 0.2 + ((0.5 - 0.2)/5)*t_data[i]
        
    elif t_data[i] < 15:
        throttle[i] = 0.5
       
    else:
        throttle[i] = ((0 - 0.5)/(20 - 15))*(t_data[i]-20 )
    
    if model.x < 60:
        alpha[i] = np.arctan(3/60)
    elif  model.x < 150:
        alpha[i]= np.arctan(9/90)
        
    model.step(throttle[i], alpha[i])
    x_data[i] = model.x
    v_data[i] = model.v
    w_e_data[i] = model.w_e

plt.title('Distance')
plt.plot(t_data, x_data)
plt.show()

plt.title('Velocity')
plt.plot(t_data, v_data)
plt.show()

plt.title('w_e')
plt.plot(t_data, w_e_data)
plt.show()


plt.title('alpha')
plt.plot(t_data, alpha)
plt.show()

plt.title('throttle')
plt.plot(t_data, throttle)
plt.show()




