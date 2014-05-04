# Class: openvpn_client
#
# This module manages openvpn_client
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class openvpn_client {

   class { 'openvpn_client::install': } ~>
   class { 'openvpn_client::service': } ->
   Class['openvpn_client']

}
