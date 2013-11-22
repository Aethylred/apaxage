# This class defines the default parameters and variables
class apaxage::params {

  require apache
  require apaxy

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