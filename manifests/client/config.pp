class zabbix::client::config {
  include zabbix::common::config

  File {
    group   => $zabbix::params::group,
    mode    => $zabbix::params::mode,
    owner   => $zabbix::params::owner,
  }

  file { $zabbix::params::client::configfile:
    ensure  => file,
    content => template('zabbix/etc/zabbix/zabbix_agentd.conf.erb'),
    require => Class['zabbix::client::install'],
  }

  file { "${zabbix::params::client::basedir}/zabbix_agentd.conf.d":
    ensure  => directory,
    require => File[$zabbix::params::client::basedir],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
