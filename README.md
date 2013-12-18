# Apaxage

The Apaxage puppet module creates an [Apaxy](http://adamwhitcroft.com/apaxy/) themed package repository for both yum and apt.

# Usage

The minimum installation required to get an apaxage yum repository working on the default document root of a  web server:

```puppet
include apaxy
class {'apaxage':
  manage_vhost  => true,
}
apaxage::repo::yum{'centos':}
```

# Resources and Classes

## The `apaxage` class

The `apaxage` class prepares the web server to host an apaxage themed package repository. The class can set up apaxy and createrepo underneath it's document root. The class does not manage the installation of Apache, but it can use apaxy to create an `apache::vhost` to manage the virtual host configuration file for the apaxage web site. Check the [Apaxy Module](https://github.com/Aethylred/puppet-apaxy) documentation on creating custom vhost configurations.

Optionally, using apaxage to install apaxy can be disabled to allow for customised installations.

The apaxage class does not deploy any assets to the apaxage site (such as images or CSS stylesheets) outside what's deployed by apaxy. If custom images or other assets are required for the HTML fragments passed to the apaxage class, they will need to be deployed by other means (e.g. using `file` resources, or deploy a custom fork of apaxy).

### Parameters

* *docroot*: Sets the path to the document root where apaxage will be set up. Defaults to the default document root for the Puppetlabs Apache module which is OS and distribution depenent.
* *header_fragment*: Inserts the string as a HTML fragment into the Apaxy header. Does nothing if the `manage_apaxy` parameter is not `true`.
* *footer_fragment*: Inserts the string as a HTML fragment into the Apaxy footer. Does nothing if the `manage_apaxy` parameter is not `true`.
* *manage_vhost*: If set to true, apaxage will set an `apache::vhost` resource to manage the Apaxage site. The default setting is `true`. If this is set to `false` the site vhost will have to be managed separately.
* *manage_apaxy*: If set to true, apaxage will set up Apaxy on the document root with the Apaxage module. The default setting is `true`. If this is set to `false` then Apaxy will have to be managed separately.

## The `apaxage::repo::yum` resource

This resource defines a yum repository as a sub directory of the apaxage site deployed by the `apaxage` class. It currently uses the createrepo module to create and maintain the repository.

### Parameters

* *repository_dir*: This specifies the directory to be used for the repository, it must be a subdirectory within the directory tree underneath an apaxage site defined by the `apaxage` class. The default is to create a subdirectory under the apaxage document root using the `apaxage::repo::yum` resource's `name`.
* *repo_cache_root_dir*:  Defines the directory where the yum repository data will be cached. The default is to use a subdirectory under `/var/cache/apaxage`.

# To Do

* Make apt repositories work (which may require somethign to handle GPG/PGP keys)
* Consider merging the repo management libraries into apaxage

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
