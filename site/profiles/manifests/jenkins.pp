class profiles::jenkins {

  $version = hiera('jenkins::version','latest')
  class {'jenkins':
     version => $version,
  }
}
