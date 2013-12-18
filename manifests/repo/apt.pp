define apaxage::repo::apt (
  $repository_dir       = "${apaxage::docroot}",
  $repo_cache_root_dir  = $apaxage::params::repo_cache_root_dir,
){

  include concat::setup

  class { 'reprepro':
    basedir => $repository_dir,
  }

  reprepro::repository { $name:
    ensure  => present,
    basedir => $repository_dir,
    options => ['basedir .'],
  }

}