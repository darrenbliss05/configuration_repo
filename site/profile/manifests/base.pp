class profile::base {
#the base profile should include component modules that will be on all nodes
accounts::user { 'monitoring':
 ensure => present,
 uid => '450',
 gid => '450',
 managehome => false,
 locked => true,
}

}

