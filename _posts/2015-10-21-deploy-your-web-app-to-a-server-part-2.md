---
layout: post
title: Deploy Your Web App To A Server - Part 2
author: guy
comments: true
---

{% include post-image.html name="1280px-Wikimedia_Foundation_Servers-8055_17.jpeg" width="150" height="75" alt="Docker logo" %}

In Part 1, we gave some background information.

In Part 2, we will use Amazon EC2 to get your web app online for free.

[Amazon EC2]("https://aws.amazon.com/ec2/") is part of Amazon's cloud computing offering. It lets you pay for a virtual server on which to host your web app. You can specify hardware components of your server, what operating system it uses, and a bunch of other things.

We'll go through setting up a LAMP environment on your virtual server.

First, you'll need to sign up for an Amazon AWS account. This will require going through some security and downloading a `.pem` file containing your Amazon key pair. You'll need this to create a new virtual server.

When you login, you'll see the AWS console. Click on EC2. You won't have any instances running yet (each virtual server is known as an instance, it is possible to have multiple instances running from the same account):

-> Launch Instance -> Amazon Linux AMI 2015.03 (HVM), SSD Volume Type -> t2.micro -> Review and Launch -> Launch

Now at the console hompage, you should see a link `Running instances 1`

Clicking brings up details of the instances you are running. This has useful information about your instance, e.g. its state, public DNS name, public IP address, id, type, geographical zone, etc.

It is also where you can set its configurations, e.g. `Security Groups` under `Network & Security`

Now that your instance is up and running, you can connect to it and use it the way that you'd use a computer sitting in front of you (with the caveat you'll have to do everything by typing [commands]("http://linuxcommand.org/lc3_lts0010.php") into a terminal interface).

You connect to the instance via something called SSH. On a Mac, if you type

{% highlight bash %}
ssh
{% endhighlight %}

into the terminal you'll see it's already installed.

Once you are connected to the instance via SSH, instead of seeing something like

{% highlight bash %}
localhost:~ joebloggs
{% endhighlight %}

you'll see something like

{% highlight bash %}
[ec2-user@ip-123-45-67-890]
{% endhighlight %}

The [Amazon documentation]("http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html#AccessingInstancesLinuxSCP") on how to do this contains all the details.

The next (slightly long-winded) step is to set up LAMP on your instance. Again, the [Amazon documentation]("http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html") on this is very good.

Once LAMP has been set up, time to transfer the app's source files and database. 

The source files can be transferred using SCP. Again, it comes pre-installed on a Mac. The tutorial on how to do this is on the same Amazon page describing how to use SSH.

There are a couple of things to note here:

1. [Copying whole directories using SCP.]("https://serverfault.com/questions/264595/can-scp-copy-directories")
2. If you used Git version control on your local machine, you'll probably want to [exclude .git and other dot files/folders using SCP.]("http://sandeep.shetty.in/2012/01/scp-excluding-git-other-dot.html") 

At some point you may also want to [force remove protected files]("https://unix.stackexchange.com/questions/72864/how-to-avoid-the-need-to-issue-y-several-times-when-removing-protected-file") or [edit files using Nano]("https://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/") on the instance.

The [database transfer]("https://paulund.co.uk/import-and-export-a-database-using-ssh") is done by first exporting the relevant database stored on the local MySQL server to a dump `.sql` file on the local machine. Transfer this file using SCP to some location on the instance and then import that file into the MySQL server on the instance.

Along the way, there probably will be permissioning issues as generally the default settings of your instance do not allow any old machine to SSH or establish HTTP connections into it.

You may have to [add a security group to your instance.]("https://serverfault.com/questions/37088/how-to-add-a-security-group-to-a-running-ec2-instance/565852#565852")

Finally, don't forget to modify any absolute paths in your app's source files accordingly. Once you've done that, your deployment to a production server should be good to go!

**Edit:** If you are only interested in doing file transfers, logging in via SFTP may be a better solution. As SCP commands are much longer (have to specify the key pair each time). With SFTP, you login once using the key pair, and this brings up the SFTP shell. From there, you use `get` and `put` to do file uploads and downloads. Terminal commands also work.

The main drawback of SFTP is that SCP is faster and there's no easy way to transfer directories. Here is a [comparison between SFTP and SCP.]("http://www.jscape.com/blog/scp-vs-sftp")

You might also want to consider `rsync` if you have lots of files to transfer

{% highlight bash %}
rsync -rh --progress -e 'ssh -i <pathtokey>;' <pathtodirectory> <user>@<server>:<path>
{% endhighlight %}

{% include disqus_comments.html %}
                 