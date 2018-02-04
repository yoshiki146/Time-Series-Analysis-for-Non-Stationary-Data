# Time-Series-Analysis-for-Non-Stationary-Data

Master's course by Assistant Professor Motegi in third quartre, 2017, Kobe University.  
The course covers theories of univariate and multivariate nonstationary time series analysis. (random walk, unit root, trend stationarity, spurious regression, cointegration, vector error correction model, etc.)
  
The syllabus is available [here](https://kym-syllabus.ofc.kobe-u.ac.jp/kobe_syllabus/2017/44/data/2017_3E612.html)  
  
The contents shared are Monte Carlo simulations under various conditions and some empirical applications using Python (Numpy, Pandas, Scikit-Learn, Statsmodels, Matplotlib, seaborn, etc.)

  
[Monte Carlo Simulation on Spurious Regression.ipynb](https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/Monte%20Carlo%20Simulation%20on%20Spurious%20Regression.ipynb)  
MC simulation on Spurious Regression under; 
* Random Walk v Random Walk ({$x_t$} and {$y_t$}, respectively)
* Random Walk with Drift v Random Walk
* Random Walk v Random Walk with Drift
* Random Walk with Drift v Random Walk with Drift

  
[Detrending-Sim.ipynb](https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/Detrending-Sim.ipynb)  
* MC simulation for trend stationary time series under given conditions to see the rate of convergence of intercept and coefficient


[Detrending_empirical](https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/Detrending_empirical.ipynb)
* Empirical application of detrending using US consumer price index retreived from FRED  

  
[UnitRootSim.ipynb](https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/UnitRootSim.ipynb)  
* Comparison of random walk with trend stationary under different sample size using Monte Carlo simulation  
* Drawing distribution forthe unit root test under $y_t = \alpha \phi y_{t-1} +\epsilon_t$, where $\alpha \ne 0$, which converges in distribution to N(0,1)
