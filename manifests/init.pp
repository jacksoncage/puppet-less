# Class: less
#
#   This module install/manages the less application.
#
#   Love Nyberg <love.nyberg@lovemusic.se>
#   2013-05-07
#
#   Tested plaforms:
#    - Debian 7.0 Wheezy
#    - CentOS 6.4
#
# Parameters:
#
#
#   $autoupdate = false
#     Whether to update the less package automatically or not.
#
#
# Actions:
#
#  Installs, configures, and manages the less application.
#
# Requires:
#
# Sample Usage:
#
#   class { "less":
#     autoupdate => false,
#   }
#
# [Remember: No empty lines between comments and class definition]
class less($ensure='running',
          $enable=true,
          $autoupdate=false
) {

  if ! ($ensure in [ 'running', 'stopped' ]) {
    fail('Ansure parameter must be running or stopped')
  }

  if $autoupdate == true {
    $package_ensure = latest
  } elsif $autoupdate == false {
    $package_ensure = present
  } else {
    fail('Autoupdate parameter must be true or false')
  }

  case $::osfamily {
    Debian: {
      $supported  = true
      $pkg_name   = [ 'less' ]
      $svc_name   = 'less'
    }
    RedHat: {
      $supported  = true
      $pkg_name   = [ 'less' ]
      $svc_name   = 'less'
    }

    Linux: {
      if ($::operatingsystem == 'Archlinux') {
        $supported = true
        $pkg_name = ['less']
        $svc_name = 'less'
      } else {
        fail("The ${module_name} module is not supported on an ${::operatingsystem} system")
      }
    }

    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }

  package { 'less':
    ensure => $package_ensure,
    name   => $pkg_name,
  }
}
