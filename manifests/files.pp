define openvpn_client::files (
  $server,
) {

  Openvpn::Server[$server] ->
  Openvpn::Client[$name] ->
  Openvpn_client::Files[$name]
  
  file { "/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys/ca.crt":
    owner => puppet,
    group => puppet,
    mode => 400,
    source => "/etc/openvpn/${server}/download-configs/${name}/keys/ca.crt"
  }
  
}