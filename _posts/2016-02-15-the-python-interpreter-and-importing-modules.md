---
layout: post
title: The Python Interpreter and Importing Modules
---

{% include post-image.html name="python-logo.png" width="75" height="50" alt="Python logo" %}

Python is an interpreted language. The interpreter goes through the source code line by line. Each line is transformed into machine code and then executed by the computer's hardware. If it encounters an error, it stops. The interpreter acts as a bridge between human-readable source code and computer hardware. It is an executable file.

To check if the Python interpreter is installed

{% highlight bash %}
python --version
{% endhighlight %}

If it is, you'll get something back like

{% highlight bash %}
Python 2.7.5
{% endhighlight %}

[ The interpreter executable file is called `python`. The path to its directory must be listed in the environment variable

{% highlight bash %}
$PATH
{% endhighlight %}

otherwise the above command errors. Even if the executable `python` is in the working directory, it errors, as the correct command then is

{% highlight bash %}
./python --version
{% endhighlight %}

If it errors, this does not mean Python is not installed. It could just be that its directory is not in `$PATH`. This is unlikely though, as usually by default Python is installed in `/usr/bin`, `/usr/local/bin`, etc. which is usually in `$PATH` ].

If the command works, how to tell the executable's location? We know it is in `$PATH`, but typically there are many paths listed there. Use the `which` command

{% highlight bash %}
which python
{% endhighlight %}

If you just type

{% highlight bash %}
python
{% endhighlight %}

this brings up the Python interactive shell

{% highlight bash %}
Python 2.7.5 (default, Mar  9 2014, 22:15:05) 
[GCC 4.2.1 Compatible Apple LLVM 5.0 (clang-500.0.68)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
{% endhighlight %}

a handy tool for testing out code snippets directly in the terminal. 

Normally though, your Python code is in a file, written using a text editor, e.g. [Sublime](https://www.sublimetext.com/). To get the interpreter to translate the code in the file into machine code

{% highlight bash %}
python /full/path/to/script.py
{% endhighlight %}

or a relative path can be used, e.g. if the script is in the working directory

{% highlight bash %}
python script.py
{% endhighlight %}

As well as translating your source code into machine code, the interpreter ensures your computer's hardware runs the machine code.

Much of Python's utility comes from pre-installed standard libraries, e.g.

{% highlight python %}
import math
{% endhighlight %}

as well as numerous third-party libraries, e.g. [pandas](http://pandas.pydata.org/). These libraries are located in one of the paths in `sys.path`

{% highlight python %}
import sys
print(sys.path)
{% endhighlight %}

and are imported via the `import` keyword. If you wish to `import` files containing your own Python code, one way to do this is by adding the path of your file to `sys.path` via the `$PYTHONPATH` environment variable.
