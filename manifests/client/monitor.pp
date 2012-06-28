class zabbix::client::monitor {
  monitor::function::process { $name:
    description => 'Zabbix Agent',
    process     => $zabbix::params::client::processname,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
