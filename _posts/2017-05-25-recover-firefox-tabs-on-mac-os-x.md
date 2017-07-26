---
layout: post
title: Recover Firefox Tabs On Mac OS X
---

### Keeping tabs

If you lose unbookmarked tabs in Firefox and for whatever reason History->Restore doesn't bring them back, all is not lost. You could regoogle them or sift through your search history.

However, there is an easier way *if your system files are backed up regularly,* e.g. via [Time Machine.](https://en.wikipedia.org/wiki/Time_Machine_(macOS)) In this case, the snapshot taken during the last backup includes files Firefox uses to restore previous sessions.

For brevity, the rest of this post assumes the path to your home directory is 

{% highlight bash %}
/home
{% endhighlight %}

In reality, it's probably something like

{% highlight bash %}
/Users/yourname
{% endhighlight %}

If you're not sure, 

{% highlight bash %}
echo $HOME
{% endhighlight %}

#### Step 1

Unhide files in Finder. 

{% highlight bash %}
defaults write com.apple.finder AppleShowAllFiles -bool true &amp;&amp; osascript -e 'quit app "Finder"'
{% endhighlight %}

(restarts Finder).

#### Step 2

Look in

{% highlight bash %}
/path/to/backup/home/Library/Application Support/Firefox/Profiles/vrjcwd35.default/sessionstore-backups
{% endhighlight %}

or a similar-looking path for the backups of

{% highlight bash %}
previous.js
recovery.bak
recovery.js
{% endhighlight %}

#### Step 3

Find the current versions of the above files.



