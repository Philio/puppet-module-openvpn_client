# OpenVPN Client Puppet Module #

This module works with [luxflux/openvpn](https://github.com/luxflux/puppet-openvpn) to automate VPN client deployment to
servers managed by puppet. It achieves this by creating exported resources of
the configs created by [luxflux/openvpn](https://github.com/luxflux/puppet-openvpn) and deploying them on the clients.

Requirements:

* Factor 2.0 with [structured facts](http://docs.puppetlabs.com/facter/2.0/fact_overview.html#writing-structured-facts) support enabled on VPN server and Puppet master.  

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