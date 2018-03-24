---
layout: post
title: Open Source Python With Github And Conda
author: familyguy
comments: true
---

{% include post-image.html name="github.png" width="120" height="80" 
alt="Conda logo" %}

When new to contributing to open source projects, half the problem can be 
just knowing where to start.

Maybe the code you wish to write is
straightforward, and yet somehow you're not sure where to begin. 

Further, whilst [Python](https://www.python.org/) has a reputation as an easy language for 
beginners, its package management is not so welcoming. One also needs 
some familiarity with [Git](https://git-scm.com/) and [Github](https://github
.com/).

Let's start with the development setup on your local machine (later, we will
 go through the Github steps). The local setup will be done using [conda.](https://conda.io/docs/)
 
## TL;DR

- fork the project you wish to contribute to on Github
- clone the fork to your local machine, `git clone`
- add the original project repository as a remote, `git remote add <x>`
- pull the latest code from the original project repository, `git fetch <x>`
- checkout your `master` branch, `git checkout master`
- merge the latest code from the original repository in, `git merge <x>/master`
- create and checkout a new feature branch that you are going to work on, 
`git checkout -b <y>`
- check `dist` and `*.egg-info` are in `.gitignore`, if not add them
- from the project root, `python setup.py egg_info` which outputs files 
(including `requires.txt`) into a `.egg-info` directory
- using the contents of `requires.txt`, create an 
 `environment.yml` file in `dist` specifying the Python version, conda 
 packages to install, PyPI packages to install, etc.
- create a conda environment, `conda env create --name <z> --file 
dist/environment.yml`
- activate the environment, `source activate <z>`
- check for "extra" packages required only when doing development work (usually 
these will be in a `requirements.txt`, `Pipfile`, or something similar; check 
developer documentation if needed)
- install these "extra" packages, `pip install --requirement requirements.txt`
 or `pip install --pipfile Pipfile` (the latter being developed at time 
 of writing. The latter may also contain the project's core dependencies, in
  which case do manual `pip` installs of the "extra" packages or put them in 
  your own `requirements.txt`. Again, if in doubt, check the documentation)
- ensure the conda environment knows about the project you cloned, `pip 
install --editable .` 
- run any tests or linting checks as per developer documentation
- make your changes to the code and repeat previous step
- check the output of any local scripts (not in the project 
directory) created for your own personal testing 
- push up your feature branch `git push origin <y>`
- select feature branch in Github, initiate pull request and do a final 
check of your changes
- submit pull request in Github

## Naive solution

On a Unix-like OS, Python is already installed. Let's suppose you wish to 
contribute to [pytube](https://github.com/nficano/pytube).

`git clone 
https://github.com/nficano/pytube.git`, make desired changes to files in 
`/path/to/pytube`, and you're good to go...

But what about testing your changes?

No problem,

`cd /path/to/pytube`

open up a Python shell,

`from pytube import YouTube...`

... and it works.

There are a couple of problems I can think of with the above:

(a) if you are not in `/path/to/pytube`, you get

```
ModuleNotFoundError: No module named 'pytube'
```

(b) if your project has third-party dependencies (ok, pytube isn't the best 
example 
here 
because it doesn't), but if it did, and these aren't part of the default 
Python installation, as soon as you write any code using one of these packages, you 
will
 get an error, as Python doesn't know where to look for them.
 
For the latter, when getting `<pkg> not found error`, we can just do `pip 
install <pkg>`.

Hmmm...

This means you are doing a global pip installation. This is bad practice as 
there are system files that rely on the default 
Python installation, so messing around with that isn't the best idea.

## Conda solution without "git clone"

Create a new (empty) conda environment

`conda create --name <myenv>`.

Then `conda install pytube`?

Well, actually *pytube* isn't a **conda package** (**package** here refers 
to a software distribution, i.e. the source files of *pytube* compiled down / 
compressed into some compact, human non-readable format). 

More importantly, when installing packages, conda looks in certain default 
locations in Anaconda Cloud, and *pytube* isn't in one of those locations. 

This is because officially, *pytube*, as a **PyPI package**, lives in the PyPI 
cloud (funny that), and this is where the project owner uploads the 
repository to. 

**Upshot:** `conda install pytube` doesn't work.

On the other hand, [pip](https://pip.pypa.io/en/stable/) does look in the 
right place by default. 

`conda install pip`

then 

`pip install pytube`

and 

`source activate <myenv>`

...and we're golden.

Regardless of your working directory, you can open a shell
 or write a script with `from pytube import YouTube` without getting an error.
 
 Moreover, `pip install pytube` looks at the dependencies
  in `setup.py` and resolves them, so you won't get a `<pkg> not found 
  error` when writing code that uses them.
  
 So we are now good for testing our changes. Speaking of which, in which
 files do we make our changes? We haven't done a `git clone` yet.
 
 It turns out `pip install pytube` installed the *pytube* source code into 
 
 `/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`
 
 Therefore we can forget about `git clone` and just edit the files in the 
 path above.

## Conda solution with "git clone"

Whilst the above solution is feasible, it is generally not recommended. 

Your gut is probably telling you it feels strange to edit files in

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`

rather than somewhere like
 
`~/Documents/pytube`.

Further, there is no version control (done previously via `git clone`). 

You could do `git init`, but what about getting the same branches as on Github
and the same commit history? 
 
If you're a Git expert, you might know how to do the above quickly. But if 
you 
were, you probably wouldn't be reading this :wink:.

Let's try a different approach.

`cd ~/Documents`

`git clone https://github.com/nficano/pytube.git`
 
Great, now we have version control and Git-wise everything is good to go in 
`~/Documents/pytube`.

Next, make the changes to files in `~/Documents/pytube`.

Suppose, for testing purposes, we added some `print()` calls. We run some code in 
a Python shell / script and wait for our logs to appear... but they don't!
 
This is because, at the moment, there are two versions of the *pytube* source 
code installed:

`~/Documents/pytube`

and

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`.

When you do `from pytube import YouTube`, it is pointing to the code in

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`

and not

`~/Documents/pytube`.

With the conda environment activated, you can check this with `import sys; 
sys.path`. In the resulting `list`, there is 

`'/path/to/anaconda/envs/<myenv>/lib/python/site-packages'`

but not `'~/Documents'`.

When Python sees an `import` statement, it goes through each of the 
directories in this `list` and looks for a directory or file `pytube`. 

Thus we are back to square one, having to edit files in 

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`

in order to test the effects of our changes locally.

We could fix this in two ways:

(a) Alter the environment so that the module search path includes
 
`~/Documents` before 

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages`

(b) `rm -r /path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`

`cp -R ~/Documents/pytube /path/to/anaconda/<myenv>/lib/python/site-packages`

It's certainly not obvious how to do (a). (b) is straightforward but means 
either we work in `~/Documents/pytube` and have to keep copying files over 
(impractical) or we work in 

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube` (not what 
we want).

However, there is a `pip` command that lets us choose (b) and work in 
`~/Documents/pytube` without having to keep copying files over:

`pip install --editable ~/Documents/pytube`.

This works by removing

`/path/to/anaconda/envs/<myenv>/lib/python/site-packages/pytube`

and replacing it with a `pytube.egg-link` file with contents

`~/Documents/pytube`

which means `from pytube import YouTube` now points to `~/Documents/pytube` 
and our logs appear.

## Conda solution with "git clone" and environment.yml

Although the above solution isn't bad, you have to accept 
whatever Python version `conda install pip` gives you.

For a library like *pytube* which is Python 2 and 3 compatible, this is a 
problem.

Before making a pull request, you need to test your code works for
both versions and therefore need to create two separate environments 
specifying a different Python version each time.

Secondly, `pip install <pkg>` means all the dependencies listed in `setup.py` of
`<pkg>` will be installed via `pip`, i.e. you will end up installing a PyPI 
package for each dependency. What if you 
wanted to install a conda package for a dependency?

One solution is to use a conda `environment.yml` file. Typically, 
this is stored in `dist` in the project root; `dist` is usually in `.gitignore`. 

Although this method is more manual, it is more flexible.

First, you get the list of 
dependencies from `setup.py` using `python setup.py egg_info` which creates 
a `.egg-info` directory (also usually in `.gitignore`) containing a 
`requires.txt` file, e.g.

```
arrow<0.12.1,>=0.8.0
logfury>=0.1.2
requests>=2.9.1
six>=1.10
tqdm>=4.5.0
```

You can then create an `environment.yml` file specifying the Python version 
and the dependecies above, e.g.

```
name: <myenv>
dependencies:
  - python=3.6.3
  - ipython=6.1.0
  - requests>=2.9.1
  - pip:
    - arrow<0.12.1,>=0.8.0
    - logfury>=0.1.2
    - six>=1.10
    - tqdm>=4.5.0
```

As you can see, some of the dependencies will be installed as conda packages,
 e.g. `requests`, others as PyPI packages, e.g. `logfury`.

Going back to our `pytube` example, if `<myenv>` is activated, deactivate it

`source deactivate`

then delete it

`conda remove --name <myenv> --all`

and create a new one, this time using an `environment.yml` file, e.g.

```
name: pytube-dev-python3
dependencies:
  - python=3.6.3
  - ipython=6.1.0
```

`conda env create --name <myenv> --file dist/environment.yml`

then

`source activate <myenv>`

`pip install --editable ~/Documents/pytube`.

## Github steps

The first step is to login to your Github account, find the repository you 
wish to contribute to, and **fork it.**

This creates a copy of the original repository in your profile's 
list of repositories which you then pull down (do not pull down the original
 repository)

`git clone git@github.com:<my-username>/<my-forked-repo-name>.git`

which creates an `origin` remote, i.e. a link between the local copy of the 
project and the copy stored online under your profile's list of repositories.

Next, create a new remote linking to the original repository (so that when 
others make changes to it, you can pull those changes into your forked 
repository)

`git remote add upstream https://github
.com/<original-username>/<original-repo-name>.git`
 
and make sure locally you are up to date 
(this needs to be done periodically as you work, and always before 
submitting a pull request)

`git fetch upstream`.

Now `upstream` is locally up to date, merge it into your `master` branch

`git checkout master`

`git merge upstream/master`

then create and checkout a new branch which you are going to work on, e.g.

`git checkout -b <my-new-feature>`.

When you are done, push this up

`git push origin <my-new-feature>`

which will create a copy of this branch in your forked repository.

Now go into Github, select your forked repository, and create a pull request
. If all your changes look ok, add any notes for the reviewer, and submit the 
pull request.
