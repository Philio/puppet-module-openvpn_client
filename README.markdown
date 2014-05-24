# OpenVPN Client Puppet Module #

This module works with [luxflux/openvpn](https://github.com/luxflux/puppet-openvpn) to automate VPN client deployment to
servers managed by puppet. It achieves this by creating exported resources of
the configs created by [luxflux/openvpn](https://github.com/luxflux/puppet-openvpn) and deploying them on the clients.

Sample Usage:

* Exporting the configurations for a client defined by [luxflux/openvpn](https://github.com/luxflux/puppet-openvpn) in the
VPN server manifest:  

        openvpn_client::export { 'my_client':  
          server => 'openvpn',  
        }  
      
* Installation, configuration and starting the OpenVPN client in a configured
node manifest:  

        openvpn_client::import { 'my_client:  
          server => 'openvpn',  
        }  