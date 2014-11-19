# Standard Puppet modules

## The r10k configuration

The `/etc/r10k.yaml` is setup with the following:

```YAML
:cachedir: '/var/cache/r10k'
:sources:
  :ugns:
    remote: 'git@github.com:UGNS/standard-modules'
    basedir: '/etc/puppet/environments'
```

This allows all branches of the repository to represent dynamic
environments under the `/etc/puppet/environments` directory.

Deployment is performed by simply running `r10k deploy environment -p`
which is performed automatically by Jenkins CI through deploy hooks.

## The puppet master configuration

The `/etc/puppet/puppet.conf` config file `[master]` section
is then updated with the following:

```INI
[master]
environmentpath = $confdir/environments
autosign = $environmentpath/$environment/scripts/autosigner.rb
```
The `environmentpath` sets up the directory environments in the Puppet master
which will be deployed via r10k.

The `autosign` script can handle automatically validating AWS EC2 instances
and could be modified easily enough for additional validation.

## The modules

Below are all modules deployed within the environment.

The Puppetfile is capable of being used with librarian
or r10k to deploy. All dependencies are included that
librarian would resolve, but r10k does not.

### GitHub modules
- __jbouse/common__: Common resources, classes & defines
  - Current Version: 0.1.0
  - Upstream Source: https://github.com/jbouse/puppet-common

- __ugns/profile__: UnderGrid Network Services profile module
  - Current Version: 0.1.4
  - Upstream Source: https://github.com/UGNS/puppet-profile

- __jbouse/roundcube__: Roundcube Webmail application
  - Current Version: 0.1.0
  - Upstream Source: https://github.com/UGNS/puppet-roundcube

### Puppet Forge modules
- __andschwa/mumble__: Installs, configures, and manages a Mumble server
  - Current Version: 0.0.3
  - Upstream Source: https://github.com/andschwa/puppet-mumble

- __arnoudj/sudo__: Manage sudoers
  - Current Version: 1.1.2
  - Upstream Source: https://github.com/arnoudj/puppet-sudo

- __dalen/puppetdbquery__: Query functions for the PuppetDB API
  - Current Version: 1.5.2
  - Upstream Source: https://github.com/dalen/puppet-puppetdbquery

- __darin/zypprepo__: A Puppet description of a zypper repository
  - Current Version: 1.0.1
  - Upstream Source: https://github.com/deadpoint/puppet-zypprepo

- __deric/accounts__: Module for managing user accounts and groups.
  - Current Version: 0.1.1
  - Upstream Source: https://github.com/deric/puppet-accounts

- __garethr/erlang__: Module for installing erlang from official repos
  - Current Version: 0.3.0
  - Upstream Source: https://github.com/garethr/garethr-erlang
  - Puppet Approved Module

- __gentoo/portage__: Puppet types and providers for Gentoo portage
  - Current Version: 2.2.0
  - Upstream Source: https://github.com/gentoo/puppet-portage

- __hunner/hiera__: Deploy hiera.yaml with hierarchy, and datadir
  - Current Version: 1.0.2
  - Upstream Source: https://github.com/hunner/puppet-hiera

- __hunner/wordpress__: Puppet module to set up multiple instances of wordpress
  - Current Version: 1.0.0
  - Upstream Source: https://github.com/hunner/puppet-wordpress

- __jamtur01/puppet_hipchat__: Puppet report handler for sending notifications to HipChat
  - Current Version: 0.4.0
  - Upstream Source: https://github.com/jamtur01/puppet-hipchat

- __jbouse/sks__: Synchronizing Key Server (SKS) Puppet module'
  - Current Version: 0.1.5
  - Upstrem Source: https://github.com/UGNS/puppet-sks

- __jfryman/nginx__: Puppet NGINX management module
  - Current Version: 0.1.1
  - Upstream Source: https://github.com/jfryman/puppet-nginx

- __lex/dnsmasq__: Puppet Dnsmasq management module
  - Current Version: 2.4.0
  - Upstream Source: https://github.com/rlex/puppet-dnsmasq

- __mhuffnagle/make__: Installs the make package
  - Current Version: 0.0.2
  - Upstream Source: https://github.com/Element84/puppet-make

- __mkrakowitzer/deploy__:
  - Current Version: 0.0.3
  - Upstream Source:

- __mkrakowitzer/jira__:
  - Current Version: 1.1.3
  - Upstream Source:
  - Puppet Approved Module

- __nanliu/staging__: Manages compressed file staging and deployment
  - Current Vrsion: 1.0.2
  - Upstream Source: https://github.com/nanliu/puppet-staging
  - Puppet Approved Module

- __nibalizer/puppetboard__: Install and configure PuppetBoard
  - Current Version: 2.5.0
  - Upstream Source: https://github.com/nibalizer/puppet-module-puppetboard

- __puppetlabs/activemq__: ActiveMQ Puppet Module
  - Current Version: 0.3.1
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-activemq

- __puppetlabs/apache__: Puppet module for Apache
  - Current Version: 1.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-apache
  - Puppet Supported Module

- __puppetlabs/apt__: Puppet Labs Apt Module
  - Current Version: 1.7.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-apt
  - Puppet Supported Module

- __puppetlabs/concat__: Concat module
  - Current Version: 1.1.2
  - Upstream Source: http://github.com/puppetlabs/puppetlabs-concat
  - Puppet Supported Module

- __puppetlabs/denyhosts__: Configure DenyHosts
  - Current Version: 0.1.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-denyhosts

- __puppetlabs/firewall__: Manages Firewalls such as iptables
  - Current Version: 1.2.0
  - Upstream Source: http://forge.puppetlabs.com/puppetlabs/firewall
  - Puppet Supported Module

- __puppetlabs/gcc__: Module for installing gcc build utils
  - Current Version: 0.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-gcc

- __puppetlabs/git__: Module for installing git
  - Current Version: 0.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-git

- __puppetlabs/inifile__: Resource types for managing settings in INI files
  - Current Version: 1.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-inifile
  - Puppet Supported Module

- __puppetlabs/java__: Manage the official Java runtime
  - Current Version: 1.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-java

- __puppetlabs/java_ks__: Manage arbitrary Java keystore files
  - Current Version: 1.2.6
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-java_ks
  - Puppet Supported Module

- __puppetlabs/mcollective__: MCollective Puppet Module
  - Current Version: 2.0.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-mcollective

- __puppetlabs/mysql__: Mysql module
  - Current Version: 3.0.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-mysql
  - Puppet Supported Module

- __puppetlabs/ntp__: NTP Module
  - Current Version: 3.3.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-ntp
  - Puppet Supported Module

- __puppetlabs/pe_gem__: Puppet Labs PE Gem module
  - Current Version: 0.0.1
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-pe_gem

- __puppetlabs/postgresql__: PostgreSQL defined resource types
  - Current Version: 4.1.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-postgresql
  - Puppet Supported Module

- __puppetlabs/puppetdb__: PuppetDB resource types
  - Current Version: 4.0.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-puppetdb

- __puppetlabs/rabbitmq__: RabbitMQ Puppet Module
  - Current Version: 4.1.0
  - Upstream Source: http://github.com/puppetlabs/puppetlabs-rabbitmq

- __puppetlabs/ruby__: Ruby Module for puppet
  - Current Version: 0.3.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-ruby

- __puppetlabs/stdlib__: Puppet Module Standard Library
  - Current Version: 4.4.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-stdlib
  - Puppet Supported Module

- __puppetlabs/tomcat__: Puppet module for managing Apache Tomcat
  - Current Version: 1.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-tomcat
  - Puppet Supported Module

- __puppetlabs/vcsrepo__: Manage repositories from various version control systems
  - Current Version: 1.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-vcsrepo

- __richardc/datacat__: Puppet type for handling data fragments
  - Current Version: 0.5.0
  - Upstream Source: https://github.com/richardc/puppet-datacat

- __ripienaar/module_data__: A hiera backend to allow the use of data while writing sharable modules
  - Current Version: 0.0.3
  - Upstream Source: https://github.com/ripienaar/puppet-module-data

- __rtyler/jenkins__: Manage the Jenkins continuous integration service with Puppet
  - Current Version: 1.3.0
  - Upstream Source: https://github.com/jenkinsci/puppet-jenkins
  - Puppet Approved Module

- __stahnma/epel__: Setup the EPEL package repo
  - Current Version: 1.0.0
  - Upstream Source: http://github.com/stahnma/puppet-module-epel
  - Puppet Approved Module

- __stankevich/python__: Puppet module for Python
  - Current Version: 1.7.10
  - Upstream Source: https://github.com/stankevich/puppet-python

- __stephenrjohnson/puppet__: Resource types for managing puppet master and agent
  - Current Version: 1.1.0
  - Upstream Source: https://github.com/stephenrjohnson/puppetmodule

- __thias/dovecot__: Dovecot IMAP server module
  - Current Version: 0.1.1
  - Upstream Source: https://github.com/thias/puppet-dovecot

- __thias/php__: PHP module
  - Current Version: 1.0.0
  - Upstream Source: https://github.com/thias/puppet-php

- __thias/postfix__: Postfix Mail Transport Agent module
  - Current Version: 0.3.3
  - Upstream Source: https://github.com/thias/puppet-postfix

- __zack/r10k__: Dynamic environments with git & r10k
  - Current Version: 2.3.0
  - Upstream Source: https://github.com/acidprime/r10k

- __zleslie/openvpn__: Puppet powered OpenVPN
  - Current Version: 1.0.0
  - Upstream Source: https://github.com/xaque208/puppet-openvpn
