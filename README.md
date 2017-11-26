## Description

Personal homepage / blog using the Jekyll theme [minima](https://jekyll.github.io/minima/).

## Installation / build instructions

### Linux

- Clone the git repository.

- Install Jekyll, e.g. on Ubuntu (as superuser)
    * `apt-get update`
    * `apt-get upgrade`
    * `apt-get install ruby-full`
    * `gem install jekyll`. Check `jekyll --version`. If error:
    * `gem install bundler`
    * `apt-get install zlib1g-dev`
    * `gem install nokogiri -v '1.8.1'`
    * `bundle install`
    * `jekyll --version`

- From the project root, `jekyll serve`

- Go to `localhost:4000` in the browser

- To check locally the deployment process, install Docker.

### Mac OS X

- Install Vagrant with an Ubuntu box and `fsnotify`

- Clone the git repository onto the host machine and the guest machine (latter requires `ssh`-ing into the Vagrant box).

- Get the Vagrant box's IP address `grep -nrw 'ip' Vagrantfile`

- Sync the newly-cloned git repositories on the guest and host machines by adding `
config.vm.synced_folder "/path/to/host-machine/repo", "/path/to/guest-machine/repo", fsnotify: true` to `Vagrantfile`. This allows editing source files with your editor of choice on the host machine and for changes to take effect without restarting the server on a page refresh. If your editor of choice is Vim, Nano, etc. you can skip this step :wink:

- Exit `ssh`, restart the Vagrant box `vagrant reload --provision <vagrantboxid>` and start a new session. 

- Install Jekyll. From the project root, `jekyll serve --host=0.0.0.0` Go in the browser to `<ipaddress>:4000` replacing `<ipaddress>` with the one obtained in the third step. You should see the app load.

- Install Docker so that you can check locally the deployment process (hence the use of Vagrant, Docker being easier to run on Linux than Mac OS X).

## Documentation

Can be found [here.](https://family-guy.github.io/blog/)
 
## License

Same as [minima](https://jekyll.github.io/minima/), i.e. [MIT](http://opensource.org/licenses/MIT).
