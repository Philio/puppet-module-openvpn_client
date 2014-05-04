# Class: openvpn_client
#
# This module works with luxflux/openvpn to automate VPN client deployment to
# servers managed by puppet. It achieves this by copying configs created by
# luxflux/openvpn to the puppet file server and which are then pulled to clients
# and installed.
#
# Parameters: none
#
# Requires: see Modulefile
#
# Sample Usage:
#
# * Copying configuration files to the file server on the puppet master node:
#
#     openvpn_client::files { 'my_client':
#       server => 'openvpn',
#     }
#
# * Installing and starting the OpenVPN client on a configured node:
#
#     openvpn_client::client { 'my_client:
#       server => 'openvpn',
#     }
#
class openvpn_client {

   class { 'openvpn_client::install': } ~>
   class { 'openvpn_client::service': } ->
   Class['openvpn_client']

}
