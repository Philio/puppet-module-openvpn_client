define openvpn_client::export (
  $server,
) {
  
  Openvpn::Server[$server] ->
  Openvpn::Client[$name] ->
  Openvpn_client::Export[$name]
  
  @@file { "/etc/openvpn/${name}.tar.gz":
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => 644,
    content  => template("/etc/openvpn/${server}/download-configs/${name}.tar.gz"),
    tag => "${server}-${name}",
  }

}