class profile::mysql {
# Mysql DB section
# Module documentation istates that this installs mysql
#include '::mysql::server'
#
# replicate-do-db needs to come from hiera
$override_options = {
  'mysqld' => {
      'replicate-do-db' => hiera_array('mysql::replicate-do-db',[]),
   }
        }

class { '::mysql::server':
    root_password           => hiera('mysql::root_password','strongpassword'),
    #root_password           => 'strongpassword',
    remove_default_accounts => true,
    override_options        => $override_options
     }

mysql::db { hiera('mysql::dbname','mydb'):
  user     => hiera('mysql::dbadmin','myadmin'),
  password => hiera('mysql::dbadminpassword','mypass'),
  dbname   =>  hiera('mysql::dbname','mydb'),
  host     => localhost,
  grant    => ['SELECT', 'UPDATE'],
}

## commented out as this is not working yet.
#include '::mysql::server::mysqltuner'

   
}

# Mysql module supports these classes. 
#mysql::server: Installs and configures MySQL.
#mysql::server::monitor: Sets up a monitoring user.
#mysql::server::mysqltuner: Installs MySQL tuner script.
#mysql::server::backup: Sets up MySQL backups via cron.
#mysql::bindings: Installs various MySQL language bindings.
#mysql::client: Installs MySQL client (for non-servers).

