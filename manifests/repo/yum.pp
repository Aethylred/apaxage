define apaxage::repo::yum (
  $repository_dir       = "${apaxage::docroot}/${name}",
  $repo_cache_root_dir  = $apaxage::params::repo_cache_root_dir,
){
  require apaxage

  $repo_cache_dir = "${repo_cache_root_dir}/${name}"

  createrepo {"apaxage_yumrepo_${name}":
    repository_dir => $repository_dir,
    repo_cache_dir => $repo_cache_dir,
  }

}