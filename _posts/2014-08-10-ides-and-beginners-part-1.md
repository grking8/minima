---
layout: post
title: IDEs And Beginners Part 1
author: familyguy
comments: true
---

{% include post-image.html name="Antu_codeblocks.png" width="70" height="70" alt="Codeblocks logo" %}

As a beginner, I have written programs both with and without an IDE.

My first experience was with Codeblocks which was used to write my first major project (at least it felt pretty major at the time).

Now, I am not saying I didn't like it. The design was pretty cool and I found it a lot nicer looking than some of the other well known IDEs out there, e.g. Eclipse.

However, after ten months without writing a single line of code, it was almost like a new beginning when it came to starting things up again. Which got me thinking. Could I take a more first principles approach and get away with not using an IDE?

As it turns out, doing so is totally possible and far from being the sole reserve of hardcore programmers. What's more, in the process I learnt a few new things about my computer.

As incredible as it may sound, a computer essentially only undertands one language - binary, i.e. a sequence of zeros and ones. This is because inside your computer there are billions of transistors operating as switches, alternating between high and low states.

Thus to write a program to calculate

`1 + 1` 

and display the result, the source code could be

{% highlight bash %}
11110000101010100000110010101010101110000110...
{% endhighlight %}

Does this mean to write a program we have to learn the meaning behind all these zeros and ones and how a computer interprets them?

Fortunately, no.

Computer scientists have developed programming languages which are much closer to natural human language, i.e. English.

We can thus replace the zeros and ones with something like

{% highlight c %}
int result = 1 + 1;
print result;
{% endhighlight %}

Progress!

How does this work?

The computer uses something called a compiler, which takes source code written in a programming language and translates it into machine code it understands.

The machine code is used to create an executable file which in turn is used to make your program run.

In terms of running your program, this is all your IDE does. The only difference is that it allows you to do it in a nice, user-friendly environment, i.e. with buttons, windows, toolbars, etc.

Let's see see how to write and run a program without using an IDE. This will be for a Mac but a similar procedure exists for Windows.

To begin, open the terminal, `Applications -> Utilities -> Terminal`.

We are going to write a program using C++.

Why C++?

No particular reason. It is a language that a lot of individuals and companies use though. Here is a list of [popular programming languages.](http://en.wikipedia.org/wiki/List_of_programming_languages)

Your Apple computer comes pre-installed with a C++ compiler. You can verify this:

{% highlight bash %}
g++ --version
{% endhighlight %}

You should see some blurb about it.

The same goes for other languages

{% highlight bash %}
gcc --version
python --version
{% endhighlight %}

will return similar responses for C and Python respectively.

Incidentally, if you try Java, it won't work. You will have to first download from Oracle the [Java virtual machine](http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html) (JVM).

Afterwards try

{% highlight bash %}
java --version
{% endhighlight %}

NB: Java is not the same as C/C++ in that it compiles to an intermediate binary form (hence the need for the JVM) before being compiled.

Having convinced ourselves that a C++ compiler exists, let's write some code.

Open your text editor of choice. I use(d to use) [TextMate](http://macromates.com/), and for Windows suggest [Notepad++.](http://notepad-plus-plus.org/)

What I like about these editors is that they format your code to make it more readable with colour and indenting but they **do not** have things such as syntax checking or auto-complete (more on this later).

Once you're done writing your program, save the file.

Time to compile it and create the executable. First, point to the directory containing the file

{% highlight bash %}
cd ~/pathtofile
{% endhighlight %}

(for more details, see this [introduction to command line instructions](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything)).

Now type

{% highlight bash %}
g++ main.cpp
{% endhighlight %}

You should see in the same directory a new file a.out.

Then

{% highlight bash %}
./a.out
{% endhighlight %}

which will run your program.

If your program prints something to the console, you will see it displayed (when using an IDE, the same output appears in the IDE's console, often towards the bottom of the window).

If you open a.out, a series of strange symbols appears. This jibber-jabber is what your computer understands which is why when you run it your program executes.

And there you go, you wrote and ran your program without an IDE!

I agree an IDE is more straightforward and allows beginners to get up and running quicker. However, I think it can sometimes lead to people getting into bad habits, e.g. over-relying on syntax checking and auto-complete.

Beginners need to get used to spotting and correcting their own mistakes. Writing code without an IDE is also closer to whiteboard coding and could serve as interview preparation.

Further, it allows programmers to operate "closer" to the machine and understand better how programs are compiled and executed.

Personally, I also find it makes organising files easier.

In contrast, more experienced programmers well-versed in evaluating and correcting their own code probably have less to gain by not using an IDE.

Not to mention their debugging needs are a great deal more significant and sophisticated. This is where good IDEs can come into their own as one-stop shops offering a variety of development tools under one roof.
