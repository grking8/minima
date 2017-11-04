---
layout: post
title: Prevent Auto-deletion of EBS
---

{% include post-image.html name="AWS_Simple_Icons_AWS_Cloud.png" width="100" height="100" alt="Amazon Web Services logo" %}

What's that I hear, aren't EBS volumes supposed to be persistent and not depend on whether an EC2 instance has been stopped or terminated? EBS Volumes **are** supposed to be persistent. However, on the Amazon website it clearly states that[EBS root device volumes are automatically deleted when the instance terminates:]("http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html")

> Instance Termination... By default, Amazon EBS root device volumes are automatically deleted when the instance terminates. However, by default, any additional EBS volumes that you attach at launch, or any EBS volumes that you attach to an existing instance persist even after the instance terminates.
                      
This last part, however, seems to contradict [elsewhere on the website]("http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html")

> Data Persistence... By default, EBS volumes that are created and attached to an instance at launch are deleted when that instance is terminated.

In any case, this default behaviour can be changed. If the instance is not yet running, this can be done via the web console. If the instance is already running, the process is a bit more involved; here is a guide on [how to modify the 'deletion on termination' flag for an EBS volume on a running EC2 instance.]("http://www.petewilcock.com/how-to-modify-deletion-on-termination-flag-for-ebs-volume-on-running-ec2-instance/")
                      
As the guide above mentions, usage of the Amazon Command Line Interface (CLI) is required. This comes preinstalled on an instance. To check it is working,

{% highlight bash %}
aws help
{% endhighlight %}

The next step is to do a [quick configuration]("http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html") of the CLI before using it to [get the root device volume of a running instance to persist]("http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#delete-on-termination-running-instance") [Save the JSON file in the working directory. You might also get an error about user permissions].