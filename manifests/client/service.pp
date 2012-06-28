class zabbix::client::service {
  service { $zabbix::params::client::servicename:
    ensure      => $zabbix::client::enable,
    enable      => $zabbix::client::enable,
    hasrestart  => $zabbix::params::client::hasrestart,
    hasstatus   => $zabbix::params::client::hasstatus,
    require     => Class['zabbix::client::config'],
    subscribe   => File[$zabbix::params::client::configfile],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
