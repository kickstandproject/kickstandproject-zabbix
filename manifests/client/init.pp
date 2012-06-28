class zabbix::client::init {
  include zabbix::client::install
  include zabbix::client::config
  include zabbix::client::service

  if ($zabbix::client::monitor) {
    include zabbix::client::monitor
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
