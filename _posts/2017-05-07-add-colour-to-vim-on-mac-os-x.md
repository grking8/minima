---
layout: post
title: Add Colour To Vim On Mac OS X
author: familyguy
comments: true
---

{% include post-image.html name="vim.png" width="50" height="40" alt="Vim logo" %}

I noticed a while ago that the Vim text editor on Amazon Linux AMI comes with colour out-of-the box whereas on my Mac (Mavericks 10.9.5) it is black and white.
This wasn't too bothersome as I don't spend much time editing files on my Mac this way. And when I do, the files are generally small scripts so having it in black and white is not much different to having it in colour.

However, recently I have been viewing and editing HTML files in Vim, and I started yearning for some colour.
If you don't have colour automatically on your Mac and you want some, you can try the below (it's very quick).

On my machine, the file I needed to modify was

{% highlight bash %}
/usr/share/vim/vimrc
{% endhighlight %}

Open the file and add the lines

{% highlight bash %}
filetype plugin indent on
syntax on
{% endhighlight %}

And you should be good to go (you may need super user permissions to edit the file).
If it didn't work, you might be able to <a href="http://vim.wikia.com/wiki/Turn_on_syntax_coloring_in_Mac_OS_X">add colors to your Vim</a> like this or you might be able to <a href="http://stackoverflow.com/questions/11088292/no-vimrc-gvimrc-and-vim-on-mac">add colors to your Vim</a> like so.