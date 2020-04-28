# Anaconda Tips

## Managing conda

Verify that conda is installed and running on your system by typing:

> conda --version

Conda displays the number of the version that you have installed. You do not need to navigate to the Anaconda directory.

Update conda to the current version. Type the following:

> conda update conda

Conda compares versions and then displays what is available to install.

If a newer version of conda is available, type y to update:

> Proceed ([y]/n)? y

## Managing environments

Conda allows you to create separate environments containing files, packages and their dependencies that will not interact with other environments.

When you begin using conda, you already have a default environment named base. You don't want to put programs into your base environment, though. Create separate environments to keep your programs isolated from each other.

1. Create a new environment and install a package in it.

> conda create --name snowflakes biopython

> Proceed ([y]/n)? y

2. To use, or "activate" the new environment, type the following:

> Windows: conda activate snowflakes

3. To see a list of all your environments, type:

> conda info --envs

A list of environments appears, similar to the following:

conda environments:

```
base           /home/username/Anaconda3
snowflakes   * /home/username/Anaconda3/envs/snowflakes
```

4. Change your current environment back to the default (base): 

> conda activate

## Managing Python

1. Create a new environment named "snakes" that contains Python 3.5:

> conda create --name snakes python=3.5

2. Activate the new environment:

> Windows: conda activate snakes

3. Verify that the snakes environment has been added and is active:

> conda info --envs

```
# conda environments:
#
base                     /home/username/anaconda3
snakes                *  /home/username/anaconda3/envs/snakes
snowflakes               /home/username/anaconda3/envs/snowflakes
```

The active environment is also displayed in front of your prompt in (parentheses) or [brackets] like this:

> (snakes) $

4. Verify which version of Python is in your current environment:

> python --version

5. Deactivate the snakes environment and return to base environment:

> conda activate

## Managing packages

In this section, you check which packages you have installed, check which are available and look for a specific package and install it.

1. To find a package you have already installed, first activate the environment you want to search. Look above for the commands to activate your snakes environment.

2. Check to see if a package you have not installed named "beautifulsoup4" is available from the Anaconda repository (must be connected to the Internet):

> conda search beautifulsoup4

Conda displays a list of all packages with that name on the Anaconda repository, so we know it is available.

3. Install this package into the current environment:

> conda install beautifulsoup4

4. Check to see if the newly installed program is in this environment:

> conda list