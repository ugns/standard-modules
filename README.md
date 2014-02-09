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
modulepath = /etc/puppet/environments/$environment/modules
manifest = /etc/puppet/environments/$environment/manifests/site.pp
autosign = /etc/puppet/environments/$environment/scripts/autosigner.rb
config_version = /etc/puppet/environments/$environment/scripts/config_version.sh $environment
```
At a minimum the `modulepath` and `manifest` are required to support the
dynamic environments r10k deploys.

The `autosign` script can handle automatically validating AWS EC2 instances
and could be modified easily enough for additional validation.

The ``config_version`` script is designed to work within our environment using Hiera
data files and dynamic environments both being handled under Git and a desire to
map configuration data and modules that are deployed.

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
  - Current Version: 0.1.1
  - Upstream Source: https://github.com/UGNS/puppet-profile

### Puppet Forge modules
- __arnoudj/sudo__: Manage sudoers
  - Current Version: 1.1.1
  - Upstream Source: https://github.com/arnoudj/puppet-sudo
- __dalen/puppetdbquery__: Query functions for the PuppetDB API
  - Current Version: 1.3.3
  - Upstream Source: https://github.com/dalen/puppet-puppetdbquery
- __garethr/erlang__: Module for installing erlang from official repos
  - Current Version: 0.2.0
  - Upstream Source: https://github.com/garethr/garethr-erlang
- __luxflux/openvpn__: OpenVPN server puppet module
  - Current Version: 2.2.1
  - Upstream Source: https://github.com/luxflux/puppet-openvpn
- __jamtur01/puppet_hipchat__: Puppet report handler for sending notifications to HipChat
  - Current Version: 0.4.0
  - Upstream Source: https://github.com/jamtur01/puppet-hipchat
- __jamtur01/pushover__: Report processor that notifies Pushover channel about failed Puppet runs
  - Current Version: 0.0.1
  - Upstream Source: https://github.com/jamtur01/puppet-pushover
- __nibalizer/puppetboard__: Install and configure PuppetBoard
  - Current Version: 1.3.0
  - Upstream Source: https://github.com/nibalizer/puppet-module-puppetboard
- __nanliu/staging__: Manages file staging.
  - Current Vrsion: 0.3.1
  - Upstream Source: https://github.com/nanliu/puppet-staging
- __puppetlabs/activemq__: ActiveMQ Puppet Module
  - Current Version: 0.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-activemq
- __puppetlabs/apache__: Puppet module for Apache
  - Current Version: 0.10.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-apache
- __puppetlabs/apt__: Puppet Labs Apt Module
  - Current Version: 1.4.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-apt
- __puppetlabs/concat__: Concat module
  - Current Version: 1.1.0-rc1
  - Upstream Source: http://github.com/puppetlabs/puppetlabs-concat
- __puppetlabs/denyhosts__: Configure DenyHosts
  - Current Version: 0.0.1
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-denyhosts
- __puppetlabs/firewall__: Manages Firewalls such as iptables
  - Current Version: 0.4.2
  - Upstream Source: http://forge.puppetlabs.com/puppetlabs/firewall
- __puppetlabs/inifile__: Resource types for managing settings in INI files
  - Current Version: 1.0.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-inifile
- __puppetlabs/java__: Manage the official Java runtime
  - Current Version: 1.0.1
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-java
- __puppetlabs/java_ks__: Manage arbitrary Java keystore files
  - Current Version: 1.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-java_ks
- __puppetlabs/mcollective__: MCollective Puppet Module
  - Current Version: 1.1.3
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-mcollective
- __puppetlabs/nginx__: Puppet NGINX management module
  - Current Version: 0.0.1
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-nginx
- __puppetlabs/ntp__: NTP Module
  - Current Version: 3.0.1
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-ntp
- __puppetlabs/postgresql__: PostgreSQL defined resource types
  - Current Version: 3.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-postgresql
- __puppetlabs/puppetdb__: PuppetDB resource types
  - Current Version: 3.0.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-puppetdb
- __puppetlabs/rabbitmq__: RabbitMQ Puppet Module
  - Current Version: 3.1.0
  - Upstream Source: http://github.com/puppetlabs/puppetlabs-rabbitmq
- __puppetlabs/stdlib__: Puppet Module Standard Library
  - Current Version: 4.1.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-stdlib
- __puppetlabs/vcsrepo__: Manage repositories from various version control systems
  - Current Version: 0.2.0
  - Upstream Source: https://github.com/puppetlabs/puppetlabs-vcsrepo
- __richardc/datacat__: Puppet type for handling data fragments
  - Current Version: 0.4.2
  - Upstream Source: https://github.com/richardc/puppet-datacat
- __stahnma/epel__: Setup the EPEL package repo
  - Current Version: 0.0.6
  - Upstream Source: http://github.com/stahnma/puppet-module-epel
- __stankevich/python__: Puppet module for Python
  - Current Version: 1.6.3
  - Upstream Source: https://github.com/stankevich/puppet-python
- __stephenrjohnson/puppet__: Resource types for managing puppet master and agent
  - Current Version: 0.0.19
  - Upstream Source: https://github.com/stephenrjohnson/puppetmodule
- __thias/dovecot__: Dovecot IMAP server module
  - Current Version: 0.1.1
  - Upstream Source: https://github.com/thias/puppet-dovecot
- __thias/postfix__: Postfix Mail Transport Agent module
  - Current Version: 0.3.0
  - Upstream Source: https://github.com/thias/puppet-postfix
