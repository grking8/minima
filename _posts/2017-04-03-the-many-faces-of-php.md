---
layout: post
title: The Many Faces Of PHP
---

{% include post-image.html name="PHP_Logo.png" width="60" height="30" alt="PHP logo" %}

Given PHP's origins, most people run PHP with the help of a web server. The latter serves static HTML files which your browser renders for viewing.

If the file contains PHP, the web server (assuming its PHP functionality is enabled) will do some magic, i.e. parse the PHP and send the resulting HTML back to the browser.

On your machine, creating an index.php file in the document root with the contents
                      
{% highlight php %}
echo php_sapi_name();
{% endhighlight %}

then navigating to

{% highlight bash %}
localhost
{% endhighlight %}

produces something like

{% highlight bash %}
apache2handler 
{% endhighlight %}

in the browser.

However, as of PHP 5, one can do the same thing using PHP's built-in server

{% highlight bash %}
php -S localhost:8000 
{% endhighlight %}

turns the current working directory into the document root and navigating to

{% highlight bash %}
localhost:8000
{% endhighlight %}

returns something like

{% highlight bash %}
cli-server
{% endhighlight %}

The third way is to run PHP without any server at all. Assuming you have the PHP interpreter installed and its path in the 'path' variable,

{% highlight bash %}
php --interactive
{% endhighlight %}

opens the PHP interactive shell. Then typing

{% highlight php %}
echo php_sapi_name();
{% endhighlight %}

returns

{% highlight php %}
cli
{% endhighlight %}