##Vagrant
This section providers the vagrantfiles to be used in conjution with the [bootstrap](https://github.com/dvadgama/machine_build_scripts/tree/master/bootstrap) scripts.


##Supplied Vagrantfiles 
- Centos6.5
- Ubuntu 14.10

##Prerequisite
- It needs vagrant to be installed on local machine

#Steps to use it 
- if using first time 
```
vagrant init
```
- To bring up a vm 
```
vagrant up puppetmaster 
```
- To ssh into machine 
```
 vagrant ssh puppetmaster 
```
- To destroy a vm 
```
vagrant destroy puppetmaster
```

##Note
- visit [vagrant up](https://www.vagrantup.com/) for further information about vagrant 
