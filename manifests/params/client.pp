class zabbix::params::client inherits zabbix::params {
  $configfile = $::operatingsystem ? {
    default => '/etc/zabbix/zabbix_agentd.conf',
  }

  $hasrestart = $::operatingsystem ? {
    default => true,
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $packagename = $::operatingsystem ? {
    default => 'zabbix-agent',
  }

  $processname = $::operatingsystem ? {
    default => 'zabbix-agent',
  }

  $servicename = $::operatingsystem ? {
    default => 'zabbix-agent',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
