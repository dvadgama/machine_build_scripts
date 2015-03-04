##bootstrap_puppetmaster.rb

This script will build the ubuntu based puppet mater in a aws environment, it hevily uses the FOG and, bootstrap script.


##It supports following ENV variables 
- **ENV['region']:**                defautls to 'eu-west-1'
- **ENV['ssh_private_key']:**       defaults to '~/.ssh/aws'
- **ENV['ssh_public_key']:**        defaults to '~/.ssh/aws.pub'
- **ENV['ssh_user']:**              defaults to 'ubuntu'
- **ENV['key_pair']:**              defaults to 'aws'
- **ENV['aws_access_key_id']:**     YOU_MUST_SUPPLY_THIS
- **ENV['aws_secret_access_key']:** YOU_MUST_SUPPLY_THIS

##Prerequisite
- You will need to install ruby gem, fog 
- 
  ``` 
   gem install fog 
  ```
- You will need to upload your public key in aws and store it in key pair.
- You will need to use approppriate username for bootstrap, depending upon image you use.

##Usage
- Once , Approprite ENV variables are set 
```
 chmod +x bootstrap_puppetmaster.rb
 ./bootstrap_puppetmaster.rb
```
##Note
 This script also happned to be one of the building block for the custom [cloud_machine](https://github.com/dvadgama/cloud_services/tree/master/lib/puppet) type , in [cloud_services](https://github.com/dvadgama/cloud_services) module
