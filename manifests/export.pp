define openvpn_client::export (
  $server,
) {
  
  Openvpn::Server[$server] ->
  Openvpn::Client[$name] ->
  Openvpn_client::Export[$name]
  
  if $::openvpn_cert_data {
    $data = $::openvpn_cert_data
  } else {
    fail ('openvpn_cert_data not defined, is pluginsync enabled?')
  }
  
  @@file { "/etc/openvpn/${name}.conf":
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => 644,
    content => $data["${server}-${name}-conf"],
    tag => "${server}-${name}",
  }
  
  @@file { "/etc/openvpn/keys/ca.crt":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content  => $data["${server}-${name}-ca"],
    tag => "${server}-${name}",
  }
  
  @@file { "/etc/openvpn/keys/${name}.crt":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => $data["${server}-${name}-crt"],
    tag => "${server}-${name}",
  }

  @@file { "/etc/openvpn/keys/${name}.key":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 600,
    content => $data["${server}-${name}-key"],
    tag => "${server}-${name}",
  }

}