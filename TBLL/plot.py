import numpy as np 
import matplotlib.pyplot as plt 
import math as mt
HEAD = 0
Nx,Ny=69,49
x0=30
with open('u_sol.dat','r') as f:
    dat = f.readlines()
with open('y_coord.dat','r') as f:
    ycoord = f.readlines()
ycoord=np.array(ycoord)
dat=np.array(dat)
dat=dat.reshape((Nx,Ny))
vel = dat[x0,0:x0]
print(vel)
y   = ycoord[0:x0]
for i in np.arange(0,len(y)):
    y[i]=mt.exp(y[i])
figure = plt.figure(figsize=[7.0,5.0])
plt.xlim([0,1.0])
plt.ylim([0,1.0])
#plt.semilogy(vel,y)
plt.plot(y,vel)
plt.show()
