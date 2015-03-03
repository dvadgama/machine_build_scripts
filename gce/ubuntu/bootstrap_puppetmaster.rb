#!/usr/bin/env ruby 

require 'fog'

#set some defaults
ENV['zone_name']       ||= 'europe-west1-b'
ENV['ssh_private_key'] ||= '~/.ssh/google'
ENV['ssh_public_key']  ||= '~/.ssh/google.pub'
ENV['ssh_user']        ||= 'ubuntu'

# create a connection
connection = Fog::Compute.new({ :provider              => 'google',
                                :google_project        => 'upheld-quanta-863',
                                :google_client_email   => ENV['client_email'],
                                :google_key_location   => ENV['key_location'],
                              })


disk_hash  = { :name => 'puppetmaster', 
              :zone_name => ENV['zone_name'], 
              :size_gb => 10, 
              :source_image => 'ubuntu-1410-utopic-v20150202'
            }

disk = connection.disks.create(disk_hash)

disk.wait_for { disk.ready?  }

vm_hash = { :name             => 'puppetmaster',
            :disks            => [disk.get_as_boot_disk(true)], 
            :machine_type     => 'f1-micro', 
            :zone_name        => ENV['zone_name'],
            :private_key_path => ENV['ssh_private_key'],
            :public_key_path  => ENV['ssh_public_key'], 
            :username         => ENV['ssh_user'],
          }

server = connection.servers.bootstrap(vm_hash)


server.scp('../../bootstrap/puppetmaster.sh','/tmp')
server.ssh('sudo chmod +x /tmp/puppetmaster.sh')
server.ssh('sudo /tmp/puppetmaster.sh Debian')
