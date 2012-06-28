# == Class: zabbix::client
#
# This class manages the Zabbix client
#
# === Parameters
#
# [*options*]
#
# === Variables
#
# === Examples
#
#  class { 'zabbix::client': }
#
# === Authors
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# === Copyright
#
# Copyright (C) 2012, PolyBeacon, Inc.
#
# This program is free software, distributed under the terms
# of the GNU General Public License Version 2. See the LICENSE
# file at the top of the source tree.
#
class zabbix::client(
  $enable   = true,
  $monitor  = true,
  $options  = {},
) {
  $defaults = {
    'LogFileSize' => '0',
    'Server'      => 'localhost',
  }
  $options_real = merge($defaults, $options)

  include zabbix::params::client
  include zabbix::client::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
