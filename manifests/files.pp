define openvpn_client::files (
  $server,
) {
  
  include openvpn
  include openvpn_client
  Openvpn::Server[$server] ->
  Openvpn::Client[$name] ->
  Openvpn_client::Files[$name]
  
  file { "/etc/puppet/modules/openfiles/${server}/${name}/ca.crt":
    owner => puppet,
    group => puppet,
    mode => 400,
    source => "/etc/openvpn/${server}/download-configs/${name}/keys/ca.crt"
  }
  
}