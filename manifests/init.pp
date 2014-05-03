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

  include openvpn
  class { 'openvpn': } ->
  Class['openvpn_client']

}
