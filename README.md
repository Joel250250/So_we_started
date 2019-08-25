# So_we_started
let start git,it can review diffrence versions of more files.
... I come from ShenZhen city.



```python
import numpy as np

class KalmanFilter(object):
    def __init__(self, F = None, B = None, H = None, Q = None, R = None, P = None, x0 = None):

        if(F is None or H is None):
            raise ValueError("Set proper system dynamics.")

        self.n = F.shape[1]
        self.m = H.shape[1]

        self.F = F
        self.H = H
        self.B = 0 if B is None else B
        self.Q = np.eye(self.n) if Q is None else Q
        self.R = np.eye(self.n) if R is None else R
        self.P = np.eye(self.n) if P is None else P
        self.x = np.zeros((self.n, 1)) if x0 is None else x0

    def predict(self, u = 0):
        self.x = np.dot(self.F, self.x) + np.dot(self.B, u)
        self.P = np.dot(np.dot(self.F, self.P), self.F.T) + self.Q
        return self.x

    def update(self, z):
        y = z - np.dot(self.H, self.x)
        S = self.R + np.dot(self.H, np.dot(self.P, self.H.T))
        K = np.dot(np.dot(self.P, self.H.T), np.linalg.inv(S))
        self.x = self.x + np.dot(K, y)
        I = np.eye(self.n)
        self.P = np.dot(np.dot(I - np.dot(K, self.H), self.P), 
        	(I - np.dot(K, self.H)).T) + np.dot(np.dot(K, self.R), K.T)

def example():
	dt = 1.0/60
	F = np.array([[1, dt, 0], [0, 1, dt], [0, 0, 1]])
	H = np.array([1, 0, 0]).reshape(1, 3)
	Q = np.array([[0.05, 0.05, 0.0], [0.05, 0.05, 0.0], [0.0, 0.0, 0.0]])
	R = np.array([0.5]).reshape(1, 1)

	x = np.linspace(-10, 10, 100)
	measurements = - (x**2 + 2*x - 2)  + np.random.normal(0, 2, 100)

	kf = KalmanFilter(F = F, H = H, Q = Q, R = R)
	predictions = []

	for z in measurements:
		predictions.append(np.dot(H,  kf.predict())[0])
		kf.update(z)

	import matplotlib.pyplot as plt
	plt.plot(range(len(measurements)), measurements, label = 'Measurements')
	plt.plot(range(len(predictions)), np.array(predictions), label = 'Kalman Filter Prediction')
	plt.legend()
	plt.show()

if __name__ == '__main__':
    example()
    
```
https://www.bzarg.com/p/how-a-kalman-filter-works-in-pictures/

- What can we do with a Kalman filter?
- How a Kalman filter sees your problem

 a simple state having only position and velocity. 
`$\vec{x} = \begin{bmatrix} 
p\\ 
v 
\end{bmatrix}$`
The Kalman filter assumes that both variables (postion and velocity, in our case) are random and Gaussian distributed. Each variable has a mean value μ, which is the center of the random distribution (and its most likely state), and a variance `$\sigma^2$`, which is the uncertainty:
![image](https://www.bzarg.com/wp-content/uploads/2015/08/gauss_1.png)

In the above picture, position and velocity are **uncorrelated**.

Position and velocity are **correlated**. The likelihood of observing a particular position depends on what velocity you have:
![image](https://www.bzarg.com/wp-content/uploads/2015/08/gauss_2.png)
This correlation is captured by something called a **covariance matrix**(`$\mathbf{\Sigma}$`). 
In short, each element of the matrix `$\Sigma_{ij}$` is the degree of correlation between the ith state variable and the jth state variable.

- Describing the problem with matrices

two pieces of information at time k: We’ll call our best estimate `$\hat{x}_k$` (the mean, elsewhere named `$\mu$` ), and its covariance matrix `$\mathbf{\Sigma}_k$`. 
```math
 
\begin{aligned}
\mathbf{\hat{x}}_k  = \begin{bmatrix}
\text{position}\\ 
\text{velocity} 
\end{bmatrix} \\
\mathbf{\Sigma}_k  = 
\begin{bmatrix} 
\Sigma_{pp}  & \Sigma_{pv} \\ 
\Sigma_{vp}  & \Sigma_{vv} \\ 
\end{bmatrix} 
\end{aligned} 
 
```
Next, we need some way to look at the current state (at time k-1) and predict the next state at time k. Remember, we don’t know which state is the "real" one, but our prediction function doesn't care. It just works on all of them, and gives us a new distribution:
![image](https://www.bzarg.com/wp-content/uploads/2015/08/gauss_7.jpg)
We can represent this prediction step with a matrix, **prediction matrix**,`$\mathbf{F_k}$`
![image](https://www.bzarg.com/wp-content/uploads/2015/08/gauss_8.jpg)
It takes every point in our original estimate and moves it to a new predicted location, which is where the system would move if that original estimate was the right one.
```math
 
\color{deeppink}{p_k} = \color{royalblue}{p_{k-1}} + \color{dark}\Delta t \color{royalblue}{v_{k-1}} 

\color{deeppink}{v_k} =  \color{royalblue}{v_{k-1}}
 
{\mathbf{\hat{x}}_k} = 
\begin{bmatrix} 
1 &  \Delta t \\ 
0 & 1 
\end{bmatrix} \color{royalblue}{
    \mathbf{\hat{x}}_{k-1}} 
    = \color{dark}{\mathbf{F}_k} \color{royalblue}{\mathbf{\hat{x}}_{k-1}} 

 
```
how to update the covariance matrix?
This is where we need another formula. If we multiply every point in a distribution by a matrix `$\mathbf{A}$`, then what happens to its covariance matrix `$\mathbf{\Sigma}$`?
```math
\begin{array}{cc}
Cov(\vec{x})=\Sigma & \\
Cov(A \vec{x})=A \Sigma A^T \\
 \mathbf{\Sigma}_k = \mathbf{F}_k \color{royalblue}{\mathbf{\Sigma}_{k-1}} 
 \color{dark}{\mathbf{F}_k^T}
\end{array}
```

- External influence

the outside world could be affecting the system.
such as :the navigation software might issue a command to turn the wheels or stop.
additional information refered as `$\overrightarrow{\mathbf{u}_k}$`

Let’s say we know the expected acceleration `$\color{darkorange}{a}$` due to the throttle setting or control commands
```math
\color{deeppink}{p_k}  = \color{royalblue}{p_{k-1}} +
\color{royalblue}{v_{k-1}} 
\color{dark}{\Delta t}  + \frac{1}{2} \color{darkorange}{a} 
\color{dark}{\Delta t}^2 

\color{deeppink}{v_k}  =  \color{royalblue}{v_{k-1}} +  \color{darkorange}{a} 
\color{dark}{\Delta t}

\text{In matrix form: }

\begin{array}{cc}
\mathbf{\hat{x}}_k = \mathbf{F}_k \color{royalblue}{\mathbf{\hat{x}}_{k-1}} +
\color{dark}
\begin{bmatrix}
\frac{\Delta t^2}{2} \\
\Delta t
\end{bmatrix} 
\color{darkorange}{a} \\
= \mathbf{F}_k \color{royalblue}{\mathbf{\hat{x}}_{k-1}} + 
\color{dark}\mathbf{B}_k \color{darkorange}{\overrightarrow{\mathbf{u}_k}}
\end{array}
```
`$\mathbf{B}_k$` is called the **control matrix** and `$\color{darkorange}{\overrightarrow{\mathbf{u}_k}}$` the **control vector.**
- External uncertainty
- Refining the estimate with measurements
- Combining Gaussians
- Putting it all together
We have two distributions: The predicted measurement with 
 ==`$(μ_0,Σ_0)=(H_k \hat{x}_k,H_k P_k H^T_k)$`==, and the observed measurement with `$ \color{deeppink}{ (μ_1,Σ_1)=(\overrightarrow{z_k},R_k)}
$`. 

```math
\mathbf{H}_k \color{royalblue}{\mathbf{\hat{x}}_k } = \color{fuchsia}{\mathbf{H}_k \mathbf{\hat{x}}_k}  + \color{purple}{\mathbf{K}} ( \color{yellowgreen}{\overrightarrow{\mathbf{z}_k}} -\color{fuchsia}{\mathbf{H}_k \mathbf{\hat{x}}_k} )  

\mathbf{H}_k \color{royalblue}{\mathbf{P}_k } \mathbf{H}_k^T  = \color{deeppink}{\mathbf{H}_k \mathbf{P}_k \mathbf{H}_k^T} - \color{purple}{\mathbf{K}} \color{deeppink}{\mathbf{H}_k \mathbf{P}_k \mathbf{H}_k^T} 


 A = \left| \begin{array}{ccc}
0.0 & 0.0 & 0.0\\
0.0 & 0.0 & 0.0\\
0.0 & 0.0 & 0.0\\
\end{array} \right| 


```



