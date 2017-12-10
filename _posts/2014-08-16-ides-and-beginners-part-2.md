---
layout: post
title: IDEs And Beginners Part 2
author: familyguy
comments: true
---

{% include post-image.html name="Antu_codeblocks.png" width="70" height="70" alt="Codeblocks logo" %}

In Part 1, we saw how to create and run a program in C++ without an IDE.

In this part, we are going to see how the process works for more complicated programs making use of functions and classes stored in separate files.

Programs, even simple ones, are generally not just written in one file. And as programs also sometimes have thousands, even millions, of lines, it is clear that having everything in one file is very poor practice.

This is why programmers like to write modular code, splitting code up into small, manageable chunks.

Let's take a look at `hello world` in C++

{% highlight cpp %}
#include <iostream>

int main() {
	std::cout << "Hello world!" << std::endl;
	return 0;
}
{% endhighlight %}

There is only one function, `main`.

Every program needs to have this function.

Let's suppose elsewhere you have another file containing functions you want to use in 'main'.

In C++, typically this file will be split into a header file and a definitions file. The former contains protoypes of the functions (usually just one line for each), e.g.

{% highlight cpp %}
#ifndef INTEGER_ARITHMETIC_H
#define INTEGER_ARITHMETIC_H

bool * sieveEratosthenes(int n);

bool isPrime(long n);

int sumOfPropDiv(int n);

int gcd(int a, int b); // a <= b

#endif
{% endhighlight %}

and the latter the body of each function.

Say in `main` we wanted to call `isPrime`.

We could write something like

{% highlight cpp %}
#include <iostream>
#include "integer_arithmetic.h"

int main() {
	int n = 43;
	std::cout << isPrime(n); << std::endl;
	return 0;
}
{% endhighlight %}

Before, we used `include` for the input output stream and to display text. We didn't have to do anything extra as this code is part of the standard library thus the compiler knows where to look for the necessary file.

However, the second `include` is for a file created by ourselves (this is also why we have replaced the angled brackets with quotation marks). Now, some manual intervention is needed.

First, the corresponding definitions file integer_arithmetic.cpp needs *only compiling* (in Part 1, we compiled and created the executable in one step):

{% highlight bash %}
g++ -c integer_arithmetic.cpp
{% endhighlight %}

This creates an object file, `integer_arithmetic.o`, in the working directory.

To create the right executable file, `integer_arithmetic.o` needs to be linked to `main.cpp` at the time of creation

{% highlight bash %}
g++ main.cpp -I filepath integer_arithmetic.o
{% endhighlight %}

`filepath` is the path to the directory containing integer_arithmetic.h (if the header and definitions files are in the same directory, the `-I` part can be omitted).

You should now see in the working directory the executable a.out.

Run this and you should see the output of `main`, i.e. `1`.

This process of compiling and linking external header and definition files can be generalised.

When developing an application, one typically finds their top-level file, i.e. the one containing the compulsory function `main`, makes calls to functions and uses classes stored in multiple header and definition files.

Each definition file needs to be compiled, giving you a list of object files which then need to be linked.

Say we have created *n* object files: `file_1.o, file_2.o, ..., file_n.o`.

Then we could write something like

{% highlight bash %}
g++ main.cpp -I filepathfile_1 -I filepathfile_2 ... -I filepathfile_n file_1.o file_2.o ...
{% endhighlight %}

One way of shortening this is to combine the *n* object files into a single file, known as a library

{% highlight bash %}
ar rvs yourlibraryname.a file_1.o ... file_n.o
{% endhighlight %}

before creating the executable

{% highlight bash %}
g++ main.cpp -I filepathfile_1 ... -I filepathfile_n yourlibraryname.a
{% endhighlight %}
