# Class: apaxage
#
# This module manages apaxage
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#

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

# [Remember: No empty lines between comments and class definition]
class apaxage(
  $docroot          = $::apache::docroot,
  $header_fragment  = $apaxage::params::header_fragment,
  $footer_fragement = $apaxage::params::footer_fragment,
  $manage_apaxy     = true,
  $manage_vhost     = true,
) inherits apaxage::params {

  if $manage_apaxy {
    apaxy::theme{'apaxage':
      docroot         => $docroot,
      header_fragment => $header_fragment,
      footer_fragment => $footer_fragment,
      attribution     => '<a href="https://github.com/Aethylred/apaxage">Apaxage Repository module</a> by <a href="https://twitter.com/Aethylred">@Aethylred</a>',
      manage_vhost    => $manage_vhost,
    }
  }

}
