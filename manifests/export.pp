define openvpn_client::export (
  $server,
) {
  
  Openvpn::Server[$server] ->
  Openvpn::Client[$name] ->
  Openvpn_client::Export[$name]
  
  @@file { "/etc/openvpn/${name}.conf":
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => 644,
    content  => "/etc/openvpn/${server}/download-configs/${name}/${name}.conf",
    tag => "${server}-${name}",
  }
  
}