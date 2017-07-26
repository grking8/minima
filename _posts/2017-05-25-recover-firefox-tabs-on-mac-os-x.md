---
layout: post
title: Recover Firefox Tabs On Mac OS X
---

### Keeping tabs

{% include post-image.html name="firefox.png" width="100" height="100" alt="Firefox logo" %}

If you lose unbookmarked tabs in Firefox and for whatever reason "History->Restore" doesn't bring them back, all is not lost. You could regoogle them or sift through your search history.

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

Find the current versions of the above files. They will probably be somewhere like

{% highlight bash %}
/home/Library/Application Support/Firefox/Profiles/vrjcwd35.default/sessionstore-backups
{% endhighlight %}

Close Firefox.

#### Step 4

Replace the current versions of the three files with their backups. If you reopen Firefox, "History->Restore" still does not work.

#### Step 5

{% highlight bash %}
cd /home/Library/Application Support/Firefox/Profiles/vrjcwd35.default
{% endhighlight %}

You should see

{% highlight bash %}
sessionstore.js
{% endhighlight %}

Rename it to 

{% highlight bash %}
sessionstore.old
{% endhighlight %}

Restoring should now return the tabs at the time of the backup. If your system does an hourly backup, for example, you will have lost at most one hour's worth of tabs.

#### Step 6

Delete 

{% highlight bash %}
sessionstore.old
{% endhighlight %}

and

hide back files in Finder

{% highlight bash %}
defaults write com.apple.finder AppleShowAllFiles -bool false &amp;&amp; osascript -e 'quit app "Finder"'
{% endhighlight %}

For more details, take a look at [what happens when you close Firefox.](https://support.mozilla.org/en-US/questions/1088713)

P.S. Close here means exiting the application completely (not closing a tab(s) or a window). "Restore Previous Session" is for when the application has been exited. If you close a tab or a window, use one of "Recently Closed Tabs" or "Recently Closed Windows."
