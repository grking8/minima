---
layout: post
title: Python 3 On Linux Amazon EC2 - Part 1
author: familyguy
comments: true
---

{% include post-image.html name="AWS_Simple_Icons_AWS_Cloud.png" width="100" height="100" alt="Amazon Web Services logo" %}

At the time of writing, the default Python installation on an EC2 instance running Amazon Linux AMI is Python 2.7 and can be found in

{% highlight bash %}
/usr/bin
{% endhighlight %}

Installing Python 3 using

{% highlight bash %}
sudo apt-get install python3
{% endhighlight %}

won't work as Amazon Linux AMI does not support

{% highlight bash %}
apt-get
{% endhighlight %}

Use instead

{% highlight bash %}
yum
{% endhighlight %}

Firstly, see what installation packages are available that could be a potential match

{% highlight bash %}
sudo yum list | grep python3
{% endhighlight %}

Then install the package wanted

{% highlight bash %}
sudo yum install python34
{% endhighlight %}

which places the files in

{% highlight bash %}
/usr/bin
{% endhighlight %}

so no need to change

{% highlight bash %}
$PATH
{% endhighlight %}

Now that we have an up-to-date version of Python, let's take a look at installing packages. The best way to do so is use a package called pip.

{% highlight bash %}
pip
{% endhighlight %}

returns a concise overview of how the package works. This default installation is located in

{% highlight bash %}
/usr/bin
{% endhighlight %}

The pip package can be updated via

{% highlight bash %}
sudo pip install --upgrade pip
{% endhighlight %}

and doing so appears to move the installation to

{% highlight bash %}
/usr/local/bin
{% endhighlight %}

as the executable in

{% highlight bash %}
/usr/bin
{% endhighlight %}

no longer works.

{% highlight bash %}
pip list
{% endhighlight %}

returns the packages installed by pip. The list shows that there are several pre-installed packages which are in

{% highlight bash %}
/usr/lib/python2.7/dist-packages
/usr/lib64/python2.7/dist-package
{% endhighlight %}

or something similar.

Where do installed packages get saved?

{% highlight bash %}
pip --version
{% endhighlight %}

returns

{% highlight bash %}
pip 7.1.2 from /usr/local/lib/python2.7/site-packages (python 2.7)
{% endhighlight %}

Let's verify installed packages get saved in

{% highlight bash %}
/usr/local/lib/python2.7/site-packages
{% endhighlight %}

Trying

{% highlight bash %}
pip install pyprimes
{% endhighlight %}

does not work and neither does

{% highlight bash %}
sudo pip install pyprimes
{% endhighlight %}

The former is due to a permission error, the latter as the super user has a different path variable to

{% highlight bash %}
$PATH
{% endhighlight %}

and thus cannot resolve the command

{% highlight bash %}
pip
{% endhighlight %}

To get round this, either change the super user path variable or, more simply, specify the full path of the pip executable

{% highlight bash %}
sudo `which pip` install pyprimes
{% endhighlight %}

To complete the verification,

{% highlight bash %}
pip show pyprimes
{% endhighlight %}

returns

```
Metadata-Version: 1.1
Name: pyprimes
Version: 0.1
Summary: Generate and test for prime numbers.
Home-page: http://pypi.python.org/pypi/pyprimes
Author: Steven D'Aprano
Author-email: steve+python@pearwood.info
License: MIT
Location: /usr/local/lib/python2.7/site-packages
Requires:
```

To uninstall,

{% highlight bash %}
sudo `which pip` uninstall pyprimes
{% endhighlight %}

In Part 2, we'll take a look at the `virtualenv` package.
