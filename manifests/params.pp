# Class: puppetdb::params
#
# This class defines default parameters used by the main module class puppetdb
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to puppetdb class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class puppetdb::params {

  ### Module specific parameters
  $jetty_template = 'puppetdb/jetty.ini.erb'
  $db_type = 'hsqldb'
  $db_host = 'localhost'
  $db_port = '5432'
  $db_name = 'puppetdb'
  $db_user = 'puppetdb'
  $db_password = fqdn_rand(100000000000)

  $install_prerequisites = true

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $service = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'java',
  }

  $process_args = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $process_user = $::operatingsystem ? {
    /(?i:FreeBSD)/ => 'puppet',
    default        => 'puppetdb',
  }

  $process_group = $::operatingsystem ? {
    /(?i:FreeBSD)/ => 'puppet',
    default        => 'puppetdb',
  }

  $config_dir = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc/puppetdb/conf.d',
    default        => '/etc/puppetdb/conf.d',
  }

  $ssl_dir = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc/puppetdb/ssl',
    default        => '/etc/puppetdb/ssl',
  }

  $config_file = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc/puppetdb/conf.d/database.ini',
    default        => '/etc/puppetdb/conf.d/database.ini',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0640',
  }

  $config_file_owner = $::operatingsystem ? {
    /(?i:FreeBSD)/ => 'root',
    default        => 'puppetdb',
  }

  $config_file_group = $::operatingsystem ? {
    /(?i:FreeBSD)/ => 'puppet',
    default        => 'puppetdb',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/puppetdb',
    /(?i:FreeBSD)/            => '/etc/rc.conf.d/puppetdb',
    default                   => '/etc/sysconfig/puppetdb',
  }

  $jetty_file = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc/puppetdb/conf.d/jetty.ini',
    default        => '/etc/puppetdb/conf.d/jetty.ini',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:RedHat|CentOS)/ => '/var/run/puppetdb/puppetdb',
    /(?i:FreeBSD)/       => '/var/run/puppetdb/puppetdb.pid',
    default              => '/var/run/puppetdb.pid',
  }

  $data_dir = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/var/db/puppetdb',
    default        => '/var/lib/puppetdb',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/puppetdb',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/puppetdb/puppetdb.log',
  }

  $ssl_setup_command = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/sbin/puppetdb ssl-setup',
    default => '/usr/sbin/puppetdb ssl-setup',
  }
  $ssl_legacy_command = '/usr/sbin/puppetdb-ssl-setup'

  $https_host = $::fqdn
  $https_port = '8081'
  $http_host  = ''    # HTTPS only by default
  $http_port  = '8080'
  $protocol   = 'tcp'

  # General Settings
  $my_class            = ''
  $source              = ''
  $source_dir          = ''
  $source_dir_purge    = false
  $template            = 'puppetdb/database.ini.erb'
  $options             = ''
  $service_autorestart = true
  $version             = 'present'
  $absent              = false
  $disable             = false
  $disableboot         = false

  ### General module variables that can have a site or per module default
  $monitor        = false
  $monitor_tool   = ''
  $monitor_target = $::ipaddress
  $firewall       = false
  $firewall_tool  = ''
  $firewall_src   = '0.0.0.0/0'
  $firewall_dst   = $::ipaddress
  $puppi          = false
  $puppi_helper   = 'standard'
  $debug          = false
  $audit_only     = false

}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

