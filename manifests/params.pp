class zabbix::params {
  $basedir = $::operatingsystem ? {
    default => '/etc/zabbix',
  }

  $group = $::operatingsystem ? {
    default => 'root',
  }

  $mode = $::operatingsystem ? {
    default => '0640',
  }

  $owner = $::operatingsystem ? {
    default => 'root',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
