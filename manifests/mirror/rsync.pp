define apaxage::mirror::rsync (
  $source,
  $target     = "${apaxage::docroot}/${name}",
  $rsync_bin  = $apaxage::params::rsync_bin,
  $delete     = undef,
  $user       = undef,
  $recursive  = undef,
  $links      = undef,
  $hard_links = undef,
  $copy_links = undef,
  $times      = undef,
  $timeout    = 300,
  $exclude    = undef,
  $include    = undef,
  $exec_user  = 'root',
) {

  if $delete{
    $del_arg = ' --delete '
  } else {
    $del_arg = ''
  }

  if $user {
    $user_arg = "${user}@"
  } else {
    $user_arg = ''
  }

  if $exclude {
    $exclude_arg = " --exclude=${exclude}"
  } else {
    $exclude_arg = ''
  }

  if $include {
    $include_arg = " --include=${include}"
  } else {
    $include_arg = ''
  }

  if $recursive {
    $recursive_arg = ' -r '
  } else {
    $recursive_arg = ''
  }

  if $links {
    $links_arg = ' --links '
  } else {
    $links_arg = ''
  }

  if $hard_links {
    $hard_links_arg = 'H'
  } else {
    $hard_links_arg = ''
  }

  if $copy_links {
    $copy_links_arg = 'L'
  } else {
    $copy_links_arg = ''
  }

  if $times {
    $times_arg = ' --times '
  } else {
    $times_arg = ''
  }

  $rsync_options = "-av${copy_links_arg}${hard_links_arg}${exclude_arg}${include_arg}${links_arg}${times_arg}${del_arg}${recursive_arg} ${user_arg}${source} ${target}"
  exec{"apaxage_mirror_rsync_${name}":
    path    => ['/bin','/usr/bin'],
    command => "${rsync_bin} ${rsync_options}",
    user    => $exec_user,
    onlyif  => "test `${rsync_bin} --dry-run --itemize-changes ${rsync_options} | wc -l` -gt 0",
    timeout => $timeout,
    logoutput => true,
    require => File[$target],
  }

}