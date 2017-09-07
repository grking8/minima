---
layout: post
title: To Source Or Not To Source
---

{% include post-image.html name="761100-960x720-preiselbeer-meerrettich-dip.jpeg" width="100" height="70" alt="Various sauces" %}

Going through some old Bash files, I noticed this kind of thing

{% highlight bash %}
source filename.sh
{% endhighlight %}

Here's a good answer on Stack Overflow explaining [why the source command is used:]("http://stackoverflow.com/questions/9326695/what-occurs-when-a-file-is-source-d-in-unix-linux-context")

> Running the command `source` on a script executes the script within the context of the current process. This means that environment variables set by the script remain available after it's finished running. This is in contrast to running a script normally, in which case environment variables set within the newly-spawned process will be lost once the script exits.
You can `source` any runnable shell script. The end effect will be the same as if you had typed the commands in the script into your terminal. 

For example, if the script changes directories, when it finishes running, your current working directory will have changed.

To see this, create a file

{% highlight bash %}
test.sh
{% endhighlight %}

with contents

{% highlight bash %}
#!/bin/sh
cd movies
{% endhighlight %}

and a directory `movies`.

{% highlight bash %}
mkdir movies
{% endhighlight %}

Change the file's permissions

{% highlight bash %}
chmod u+x test.sh
{% endhighlight %}

Run the file normally

{% highlight bash %}
./test.sh
pwd
{% endhighlight %}

which shows the same directory.

Now try running the file with `source`

{% highlight bash %}
source test.sh
pwd
{% endhighlight %}

which shows you are in `movies`.