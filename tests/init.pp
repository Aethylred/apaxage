# This file is part of the apaxage Puppet module.
#
#     The apaxage Puppet module is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     The apaxage Puppet module is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with the apaxage Puppet module.  If not, see <http://www.gnu.org/licenses/>.
class{'apache':
  default_vhost     => false,
  default_ssl_vhost => true,
}
include apaxy
class {'apaxage':
  manage_vhost  => true,
}
apaxage::repo::yum{'centos':}

file{'/var/www/puppetlabs':
  ensure => 'directory',
}
file{'/var/www/puppetlabs/apt':
  ensure => 'directory',
}
file{'/var/www/puppetlabs/apt/precise':
  ensure => 'directory',
}
file{'/var/www/puppetlabs/yum':
  ensure => 'directory',
}

# Try some mirroring:
notice('mirroring apt')
apaxage::mirror::rsync{'puppetlabs-apt':
  source      => 'rsync://apt.puppetlabs.com/packages/apt/dists/precise',
  target      => '/var/www/puppetlabs/apt',
  delete      => true,
  copy_links  => true,
  hard_links  => true,
}
# notice('mirroring yum')
# apaxage::mirror::rsync{'puppetlabs-yum':
#   source      => 'rsync://yum.puppetlabs.com/packages/yum',
#   target      => '/var/www/puppetlabs',
#   delete      => true,
#   copy_links  => true,
#   hard_links  => true,
#   exclude     => 'SRPMS',
# }