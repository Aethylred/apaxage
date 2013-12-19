# This class defines the default parameters and variables
class apaxage::params {

  require apache
  require apaxy

  $header_fragment = '<h1>Apaxage Package Repository</h1><hr></hr>'
  $footer_fragment = 'You can add your own HTML above or below the directory listing. Simply set the <tt>header_fragment</tt> and <tt>footer_fragment</tt> parameters of the <tt>apaxage</tt> class in your Puppet manifest.'

  $repo_cache_root_dir = '/var/cache/apaxage'

  $rsync_bin = '/usr/bin/rsync'

  # OS check does nothing and redundant as Apache catches all the
  # required cases.
  case $::osfamily {
    Debian:{

    }
    RedHat:{

    }
    default:{
      fail("The apaxage class is not configured for ${::osfamily} distributions.")
    }
  }
}