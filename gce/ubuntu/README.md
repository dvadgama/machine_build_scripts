##bootstrap_puppetmaster.rb

This script will build the ubuntu based puppet mater in a aws environment, it hevily uses the FOG and, bootstrap script.


##It supports following ENV variables 
- **ENV['zone_name']:**        defautls to 'europe-west1-b'
- **ENV['ssh_private_key']:**  defaults to '~/.ssh/aws'
- **ENV['ssh_public_key']:**   defaults to '~/.ssh/aws.pub'
- **ENV['ssh_user']:**         defaults to 'ubuntu'
- **ENV['key_pair']:**         defaults to 'aws'
- **ENV['client_email']:**     YOU_MUST_SUPPLY_THIS
- **ENV['key_location']:**     YOU_MUST_SUPPLY_THIS

##Usage
- Once , Approprite ENV variables are set 
```
 chmod +x bootstrap_puppetmaster.rb
 ./bootstrap_puppetmaster.rb
```
##Note
- This script also happned to be one of the building block for the custom [cloud_machine](https://github.com/dvadgama/cloud_services/tree/master/lib/puppet) type , in [cloud_services](https://github.com/dvadgama/cloud_services) module

- You will need to remove the pass phrase from google supplied p12 key, to do that , use following command
```
openssl pkcs12 -in <google_key_file_with_passphrase>.p12  -nodes -out <google_key_file_without_passphrase>.pem -passin pass:<passphrase>
```
- default passprhase is 'notasecret'
