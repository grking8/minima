---
layout: post
title: Reverse A CSV In PHP
author: familyguy
comments: true
---

{% include post-image.html name="PHP_Logo.png" width="60" height="30" alt="PHP logo" %}

If you've had any experience doing practical programming tasks in Python or JavaScript, you've probably come across package managers like pip and npm, and enjoyed the convenience of such tools.

For example, in Python

{% highlight bash %}
pip install pandas
{% endhighlight %}

installs Python's de facto data analysis package, [pandas](http://pandas.pydata.org/) (itself built on top of the excellent numerical analysis library [NumPy](http://www.numpy.org/)) via pip from PyPI.

All you have to do then is

{% highlight python %}
import pandas as pd
import numpy as np
{% endhighlight %}

at the top of your script and you're good to go, with some serious tools at your fingertips, e.g.

{% highlight python %}
df = pd.DataFrame(
    np.random.randint(0,100,size=(100, 4)),
    columns=list('ABCD')
)    
{% endhighlight %}

gives you a 100x4 dataframe with the column names of your choice filled with random integers between 0 and 100. Not bad, eh?

So what about PHP?

Well, PHP has its own package manager, Composer, which is no slouch either.

In the remainder of the post, we are going to go through the process of taking a CSV, parsing the data into memory, reversing the order of the data and then outputting a new CSV with the data in the new reversed order. Moreover, we are going to see what third-party libraries PHP has to help do this.
Now, anyone who has tried doing this in native PHP has probably noticed it's a bit of a faff. Hopefully, you'll find the method below simpler.

First, you need to install [Composer](https://getcomposer.org/), which is just an executable binary, nice and lightweight. The official site has clear instructions on how to do this. We'll assume in this post that you're on a Unixy system and have the Composer executable in your PATH variable.

I'm led to believe that most PHP libraries worth their salt can be found on [Packagist.](https://packagist.org/) Let's hop on over there and see what we get if we type in "csv".
The first match that comes up is [league/csv.](http://csv.thephpleague.com/) Looks pretty slick from the examples, and documentation seems good, too.

Let's make a root directory for our task

{% highlight bash %}
mkdir myprojectroot
cd myprojectroot
composer require league/csv:^8.0
{% endhighlight %}

The last line downloads the package into your project root and does some configuration.
You should see two files, composer.json and composer.lock, as well as a vendor directory (this is where the package's source files are).
Let's suppose your CSV is in the project root, and that the project root is the current working directory.
Fire up your editor and type in something like

{% highlight php %}
#!/usr/bin/env php
<?php
require __DIR__ . '/vendor/autoload.php';

use League\Csv\Reader;
use League\Csv\Writer;

$reader = Reader::createFromPath(__DIR__ . '/mycsv.csv');
$headers = $reader->fetchOne();
$records = $reader->setOffset(1)->fetchAll();

$records = array_reverse($records);

$writer = Writer::createFromPath(__DIR__ . '/myreversed.csv', 'w+');
$writer->insertOne($headers);
$writer->insertAll($records);
{% endhighlight %}

Save your script into the project root and give it executable permissions

{% highlight php %}
chmod u+x myscript.php
{% endhighlight %}
                
run it

{% highlight php %}
./myscript.php
{% endhighlight %}

and presto, you should see a new CSV file with the rows reversed in the project root.
