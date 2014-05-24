# Class: openvpn_client
#
# This module works with luxflux/openvpn to automate VPN client deployment to
# servers managed by puppet. It achieves this by creating exported resources of
# the configs created by luxflux/openvpn and deploying them on the clients.
#
# Parameters: none
#
# Requires: see Modulefile
#
# Sample Usage:
#
# * Exporting the configurations for a client defined by luxflux/openvpn:
#
#     openvpn_client::export { 'my_client':
#       server => 'openvpn',
#     }
#
# * Installation, configuration and starting the OpenVPN client on a configured
#   node:
#
#     openvpn_client::import { 'my_client:
#       server => 'openvpn',
#     }
#
class openvpn_client {

   class { 'openvpn_client::install': } ~>
   class { 'openvpn_client::service': } ->
   Class['openvpn_client']

}
