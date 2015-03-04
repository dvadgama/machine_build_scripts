##puppetmaster
These script, is responsible to install puppet matster with hiera, on desired Virtualisation platform

##Steps of this script
- install latest/appropriate version of  puppet(client)
- install r10k ( a ruby gem to manager puppet libraray, you can find more about it [here](http://terrarum.net/blog/puppet-infrastructure-with-r10k.html)
- install r10k file 
  - r10k.yaml
    ```
    sources:
     Puppetfile:
      basedir: /etc/puppet/environments/
      remote: "https://github.com/dvadgama/puppetfile.git"
     
      hiera_data:
       basedir: /etc/puppet/data/
       remote: "https://github.com/dvadgama/puppet_data.git"

    purgedirs:
     - /etc/puppet/environments

    cachedir: /var/cache/r10k

    ```
  - This files says
     - from where to get [puppetfile](https://github.com/dvadgama/puppetfile.git) and, where to deploy it i.e. "/etc/puppet/environments/" in this case
     - from where to get [hiera-data](https://github.com/dvadgama/puppet_data.git) and, where to deploy it i.e. "/etc/puppet/data/" in thid case
- deploy r10k in default "master" environment.This default environemt is master because, that is the only and default branch in git repo, pointed by /etc/r10k.yaml.
  - deployment does two things
    - it installs module listed in [puppetfile](https://github.com/dvadgama/puppetfile/blob/master/Puppetfile)  under /etc/puppet/environments/master
    - it installs [hiera-data](https://github.com/dvadgama/puppet_data.git) under /etc/puppet/data/master/
- Once all of it is done , install the hiera config  & puppetmaster with 'puppet apply' 
