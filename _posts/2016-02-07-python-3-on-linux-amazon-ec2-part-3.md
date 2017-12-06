---
layout: post
title: Python 3 On Linux Amazon EC2 - Part 3
author: familyguy
comments: true
---

{% include post-image.html name="AWS_Simple_Icons_AWS_Cloud.png" width="100" height="100" alt="Amazon Web Services logo" %}
            
In this post we are going to look at using `virtualenvwrapper` in conjunction with `virtualenv`.

First, install it

{% highlight bash %}
sudo `which pip` install virtualenvwrapper
{% endhighlight %}

and add the line

{% highlight bash %}
source /usr/local/bin/virtualenvwrapper.sh
{% endhighlight %}

to `.bash_profile`.

Restart the shell

{% highlight bash %}
exec bash -l
{% endhighlight %}

One of the benefits of using `virtualenvwrapper` is that it makes it easier to create virtual environments. From

{% highlight bash %}
virtualenvwrapper --help
{% endhighlight %}

we have

{% highlight bash %}
mkvirtualenv: Create a new virtualenv in $WORKON_HOME
{% endhighlight %}

Next,

{% highlight bash %}
$WORKON_HOME 
{% endhighlight %}

needs to be set in `.bash_profile`, e.g. by adding

{% highlight bash %}
export WORKON_HOME=~/.virtualenvs
{% endhighlight %}

To test, the most common commands are

{% highlight bash %}
workon
{% endhighlight %}

which returns a list of all virtual environments, as does

{% highlight bash %}
lsvirtualenv
{% endhighlight %}

Other common commands are

{% highlight bash %}
mkvirtualenv venv1
deactivate
rmvirtualenv venv1
{% endhighlight %}

(when a new virtual environment is created, it is automatically activated, and an environment cannot be deleted whilst activated).