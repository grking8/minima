---
layout: post
title: Deploy Your Web App To A Server - Part 1
author: familyguy
comments: true
---

{% include post-image.html name="1280px-Wikimedia_Foundation_Servers-8055_17.jpeg" width="150" height="75" alt="rack server" %}

 This post is part one of two explaining how to move your web app from `localhost` to a live web server.

 Once done, people can go online and use your app!


If you're in a hurry and just want to get your app deployed without worrying about the details, you can skip to Part 2.

Let's take a moment to think about how `localhost` works. 

The two main advantages of developing your app locally before deploying it to a production server are:


- You can work offline
- You can test the effects of code changes before letting users see them

To make things concrete, suppose you've been working locally on your computer using MAMP (Mac OS X, Apache, MySQL and PHP). Let's ignore MySQL and PHP here and focus instead on the other bits.

Every web app needs a server to work. The word 'server' is an example of a [metonymy.]("https://en.wikipedia.org/wiki/Metonymy") It refers to the computer storing the app's source files **and** the software on that computer serving those files to users' browsers (boy, was this a source of confusion for me in the beginning).

You may have heard of other web development stacks, e.g. LAMP, WAMP, MEAN. Typically, the name contains four parts, referencing:

1. An operating system
2. A web server (software)
3. A database
4. A scripting language

Common examples of 1.

- Windows
- Mac OS X
- Linux

of 2.

- Apache
- IIS
- Nginx

of 3. 

- MySQL
- Mongo DB
- PostgreSQL

of 4.

- PHP
- Ruby
- Python
- ASP.NET

Developers can mix and match but certain combinations aren't possible, e.g. you can't have an IIS server on Mac OS X (not without some extra fiddling around anyway).

If we consider the computer storing the app's source code, 1. is that computer's operating system and 2. is the software on that computer responsible for responding to HTTP requests from browsers with the source files.

[A quick note on how static web pages are served to a browser. The computer acting as a server is connected to the internet, on its hard drive is the web page's source code. The computer has a DNS entry, e.g. `myserver.somewhere.com`. It also has a document root which is just a directory, e.g. `/Users/joebloggs/Sites`. Meanwhile, a user on another computer (the client) is also connected to the internet and types into their browser `myserver.somewhere.com/Test/hello_world.php`. Web server software on the server computer looks for a file called `hello_world.php` in `/Users/joebloggs/Sites/Test`. If such a file can't be found, it returns an error. Otherwise, it serves the file to the browser which renders it for the user to view.]

When working locally, you don't need an internet connection because the computer making the request and the computer sending the response are one and the same, namely yours!

Continuing with our MAMP example, when you type into your browser `http://localhost/joebloggs` Apache searches for a file on your computer called `index.php` in `/Users/joebloggs/Sites` (`index.php` is the file name searched if one isn't given in the HTTP request). No internet connection is required to do this because of the special meaning given to the address `localhost`.

If instead you typed in your browser `http://google.com` a HTTP request would be attempted to be sent over the Internet to a Google server and a response sent back (again, over the Internet).

We would like to host our app on a server so that anyone online can use it. Given that we have already been using `localhost` to test our app in local development, one solution is to simply use our own computer as a server. As long as our computer is online, Apache can serve responses just as it did before (the difference being now requests do not only come from our own computer, but the whole world). Our computer just needs to [have its ports opened up]("https://managewp.com/how-to-access-a-local-website-from-internet-with-port-forwarding") so clients with any IP address can have their HTTP requests responded to.

Although this is a possible solution, it is not a very good one as

- Your computer is not usually always online.
- Your computer is not designed to be a server. As soon as any siginificant traffic starts coming through, there will be performance bottlenecks.
- You can no longer test changes to your app before putting them live.

In the past, one could purchase dedicated server hardware and assure power supply and internet connectivity. Once your app is finished locally, you upload its files and database on to it. Disadvantages of this are

- Cost
- Technical knowledge barrier
- Physical space requirement

Today there exist a number of alternatives.

In Part 2, we will see how to use [Amazon EC2]("https://aws.amazon.com/ec2/") to get your app online for free for one year. This is part of Amazon's web services offering and sometimes referred to as Infrastructure as a Service (IaaS). This is different to something such as [Heroku]("https://www.heroku.com/") which is Platform as a Service (PaaS).

Although both achieve the same goal of deploying a web app, PaaS is quicker and easier to implement whereas IaaS is more flexibile and manual.

**Edit:** Some users may have noticed typing `127.0.0.1` produces the same outcome as `localhost` as does your machine's local IP address (on a Mac, you can find this out with `ipconfig getifaddr en0`).

However, whilst the first two work offline, the third doesn't as the local IP address is created by your router when it is online.
