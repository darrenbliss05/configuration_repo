class profiles::gitlab {

  $external_url = hiera('gitlab::external_url','http://gitlab.mydomain.tld')
  class {'gitlab':
     external_url => $external_url,
  }
}

