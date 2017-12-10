---
layout: post
title: Python 3 On Linux Amazon EC2 - Part 2
author: familyguy
comments: true
---

{% include post-image.html name="AWS_Simple_Icons_AWS_Cloud.png" width="100" height="100" alt="Amazon Web Services logo" %}

In this post, we'll be looking at the `virtualenv` package.

Its use is fairly standard as it solves a common problem when programming in Python.

As mentioned in Part 1, Python imports modules by looking through a list of directory paths. What happens when two modules have the same name? You could introduce some logic into your script to ensure the right module is imported, but this is time consuming, error prone and quickly gets out of hand for large projects.

Suppose you're using an API and your scripts import several modules from it. The version of the API you're using is going to be sunset. You could remove the current package and replace it with the new one, but this risks breaking things as changes may be required before your current project is compatible with the new API.

You decide to download the new package as well, i.e. have both in your global environment. That way you can make the necessary changes to ensure compatibility with the new API whilst ensuring everything still functions as before with the old API.

However, when you import a module, it's not clear which version of the API you're using.
One solution is to separate your projects into virtual environments. Each one contains a copy of the Python interpreter, pip, and installed packages that is completely independent of those on the global environment as well as all other virtual environments.

The virtualenv package should already be installed. To confirm,

{% highlight bash %}
pip list
{% endhighlight %}

As per usual,

{% highlight bash %}
virtualenv --help
{% endhighlight %}

provides a useful summary of the package's functionality. Each virtual environment is a directory. To keep things organised,

{% highlight bash %}
cd ~
mkdir .virtualenvs
{% endhighlight %}

This creates a hidden folder in the user's home directory in which all the virtual environments are going to be saved. To create a virtual environment in that directory

{% highlight bash %}
cd .virtualenvs
virtualenv -p /path/to/a/python/interpreter myvenv
{% endhighlight %}

To delete it

{% highlight bash %}
rm -rf myvenv
{% endhighlight %}

To activate it, run the 'activate' executable

{% highlight bash %}
source /path/to/myvenv/bin/activate
{% endhighlight %}

If successful, the shell prompt changes to

{% highlight bash %}
(myvenv)$
{% endhighlight %}

With the virtual environment activated, the interpreter, pip, list of installed packages are all specific to that environment, e.g.

{% highlight bash %}
pip list
{% endhighlight %}

returns the packages installed for the virtual environment 'myvenv'.

To install a package in the virtual environment currently activated,

{% highlight bash %}
pip install pyprimes
{% endhighlight %}

As this is not a global installation, there are no permissioning issues like before. This installs the package to

{% highlight bash %}
/path/to/myvenv/lib/python3.4/site-packages
{% endhighlight %}

To uninstall,

{% highlight bash %}
pip uninstall pyprimes
{% endhighlight %}

To exit the virtual environment,

{% highlight bash %}
deactivate
{% endhighlight %}

In the next post, we'll take a look at the virtualenvwrapper package which makes using virtualenv (even) easier.
