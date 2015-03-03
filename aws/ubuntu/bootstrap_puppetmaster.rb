#!/usr/bin/env ruby 

require 'rubygems'
require 'fog'

#set the default values if ENV['variable' is not set already

ENV['region']         ||= 'eu-west-1'
ENV['ssh_private_key']||= '~/.ssh/aws'
ENV['ssh_public_key'] ||= '~/.ssh/aws.pub'
ENV['ssh_user']       ||= 'ubuntu'
ENV['key_pair']       ||= 'aws'


# create a connection
connection = Fog::Compute.new({
  :provider                 => 'AWS',
  :aws_access_key_id        => ENV['aws_access_key_id'],
  :aws_secret_access_key    => ENV['aws_secret_access_key'],
  :region                   => ENV['region'],
})


vm_hash = { :image_id => "ami-f0b11187",
            :tags => { 'Name' => 'puppetmaster'},
            :flavor_id => 't2.micro',
            #prameters used bootstrap
            :private_key_path => ENV['ssh_private_key'], 
            :public_key_path => ENV['ssh_public_key'],
            :username => ENV['ssh_user'],
            :key_name => ENV['key_pair'],
          }

server = connection.servers.bootstrap(vm_hash)
server.scp('../../bootstrap/puppetmaster.sh','/tmp')
server.ssh('chmod +x /tmp/puppetmaster.sh')
server.ssh('sudo /tmp/puppetmaster.sh Debian')
