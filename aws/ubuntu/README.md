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

##Usage
- Once , Approprite ENV variables are set 
```
 chmod +x bootstrap_puppetmaster.rb
 ./bootstrap_puppetmaster.rb
```
