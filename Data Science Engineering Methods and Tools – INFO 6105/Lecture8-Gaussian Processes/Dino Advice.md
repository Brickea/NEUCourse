hi class,

Tough math today. But so totally worth it because it brings you closer to 3 magical lines of code (apart from the imports):

from sklearn import gaussian_process
from sklearn.gaussian_process.kernels import Matern, WhiteKernel, ConstantKernel

kernel = ConstantKernel() + Matern(length_scale=2, nu=3/2) + WhiteKernel(noise_level=1)
gp = gaussian_process.GaussianProcessRegressor(kernel=kernel)
gp.fit(X, y)

that fit *any observations* into a smooth curve that you can sample from, and work directly in data space without having to work in parameter space.

3 lines of code. Best possible interpolation of datapoints. Now you know.

Do you need to know the math? No. But the more you can understand, the better for you in the long run.

As for PyMC3, a powerful library, but a bit of an underpar GP implementation (students from Google camp). So, if it takes too long to run on your laptop, replace:

    trace = pm.sample(2000, n_init=500, njobs=1)

with:
    trace = pm.sample(500, n_init=100, chains=2, cores=1)

or:
    trace = pm.sample(5000, n_init=100, chains=2, cores=1, step=pm.Metropolis())

Finish the lab in the notebook. Email me if it does not run on your laptop.

-dino

# Homework

Find an interesting dataset where a single (independent) column has a much stronger **distance correlation** (DC) with the (dependent) column you want to model than all other possible independent columns. Then, use `scikit-learn` to run a regression forest based on that single independent column and predict a range of missing datapoints. Then do the same prediction with all possible independent columns. Then, model the dependent variable with `scikit-learn`'s GP and draw a smooth interpolation with the same range of missing datapoints. Which of the 3 methods yield better predictions?

## Bonus points

Repeat with `PyMC3` instead of `scikit-learn`.

Rasmussen & Williams is at: http://www.gaussianprocess.org/

Midterm Exam

Dear class,

We will have the midterm exam on 11/11 Monday

Half hour closed book exam, then full hour open book data science problem.

If you have any doubts about the midterm, feel free to ask TA on piazza or during their TA Hours.

NO CHEATING DURING EXAM!

Thank you!  O(∩_∩)O~