# Apaxage

The Apaxage puppet module creates an [Apaxy](http://adamwhitcroft.com/apaxy/) themed package repository for both yum and apt.

# Danger Will Robinson Danger

This module is a Work In Progress.

# Classes

## Using the apaxage class

### Parameters

* *docroot*: Sets the path to the document root where apaxage will be set up. Defaults to the default document root for the Puppetlabs Apache module which is OS and distribution depenent.
* *manage_vhost*: If set to true, apaxage will set an `apache::vhost` resource to manage the Apaxage site. The default setting is `true`. If this is set to `false` the site vhost will have to be managed separately.
* *manage_apaxy*: If set to true, apaxage will set up Apaxy on the document root with the Apaxage module. The default setting is `true`. If this is set to `false` then Apaxy will have to be managed separately.

# Dependencies

* [Aethylred's Apaxy Module](https://github.com/Aethylred/puppet-apaxy)
* [Pall Valmundsson's createrepo Module](https://github.com/pall-valmundsson/puppet-createrepo)
* [Joe Topjian's reprepo Module](https://github.com/jtopjian/puppet-reprepro)
* [Puppetlabs Apache Module](https://github.com/puppetlabs/puppetlabs-apache)
* [Puppetlabs vcsrepo Module](https://github.com/puppetlabs/puppetlabs-vcsrepo)
* [Git](http://git-scm.com/) either install the required packages or use a [Git Puppet Module](https://github.com/nesi/puppet-git) 

# Attribution

The Apaxage module was written by Aaron Hicks 2013

## puppet-blank

This module is derived from the [puppet-blank](https://github.com/Aethylred/puppet-blank) module by Aaron Hicks (aethylred@gmail.com)

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

## rspec-puppet-augeas

This module includes the [Travis](https://travis-ci.org) configuration to use [`rspec-puppet-augeas`](https://github.com/domcleal/rspec-puppet-augeas) to test and verify changes made to files using the [`augeas` resource](http://docs.puppetlabs.com/references/latest/type.html#augeas) available in Puppet. Check the `rspec-puppet-augeas` [documentation](https://github.com/domcleal/rspec-puppet-augeas/blob/master/README.md) for usage.

This will require a copy of the original input files to `spec/fixtures/augeas` using the same filesystem layout that the resource expects:

    $ tree spec/fixtures/augeas/
    spec/fixtures/augeas/
    `-- etc
        `-- ssh
            `-- sshd_config

# Gnu General Public License

[![GPL3](http://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses)

This file is part of the apaxage Puppet module.

The apaxage Puppet module is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The apaxage Puppet module is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the apaxage Puppet module.  If not, see <http://www.gnu.org/licenses/>.
