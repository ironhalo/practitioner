class system::hashadmins {

  require mysql::server

  $user_hash = {
    'zack@localhost'       => { 
      ensure               => present,
      max_queries_per_hour => 1200,
    },
    'monica@localhost' => {
      ensure           => present,
    },
    'ralph@localhost' => {
      ensure          => present,
    },
    'brad@localhost' => {
      ensure         => present,
    },
    'luke@localhost' => {
      ensure         => present,
    },
  }

  $resource_defaults = {
    max_queries_per_hour => 600,
  }

  create_resources('mysql_user', $user_hash, $resource_defaults)

}
