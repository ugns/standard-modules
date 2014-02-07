#!/usr/bin/env ruby

require 'fog'
require 'puppet'
require 'puppet/ssl/certificate_request'

clientcert = ARGV.pop

csr = Puppet::SSL::CertificateRequest.from_s(STDIN.read)
pp_instance_id = csr.request_extensions.find { |a| a['oid'] == 'pp_instance_id' }
pp_image_name = csr.request_extensions.find { |a| a['oid'] == 'pp_image_name' }
instance_id = pp_instance_id['value'] if pp_instance_id
image_id = pp_image_name['value'] if pp_image_name

retcode = 0

Fog.credentials_path = '/etc/puppet/.fog'
Fog.credential = :default

begin
  ec2 = Fog::Compute.new(:provider => :aws)
  server = ec2.servers.find { |s| s.id == instance_id }
rescue
  server = nil
end

if csr.name != clientcert
  retcode = 1
elsif not server
  retcode = 2
elsif server.state != 'running'
  retcode = 3
elsif pp_image_name and server.image_id != image_id
  retcode = 4
end

exit retcode
