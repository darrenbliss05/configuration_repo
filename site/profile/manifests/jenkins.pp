class profile::jenkins {

  $version = hiera('jenkins::version','latest')
  class {'jenkins':
     version => $version,
  }
}
