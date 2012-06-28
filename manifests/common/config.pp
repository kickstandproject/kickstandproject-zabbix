class zabbix::common::config {
  file { $zabbix::params::basedir:
    ensure  => directory,
    group   => $zabbix::params::group,
    mode    => $zabbix::params::mode,
    owner   => $zabbix::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
