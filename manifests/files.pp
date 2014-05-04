define openvpn_client::files (
  $server,
) {
  
  Openvpn::Server[$server] ->
  Openvpn::Client[$name] ->
  Openvpn_client::Files[$name]

  file {
    [ "/etc/puppet/files/openvpn",
      "/etc/puppet/files/openvpn/${server}",
      "/etc/puppet/files/openvpn/${server}/download-configs",
      "/etc/puppet/files/openvpn/${server}/download-configs/${name}",
      "/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys" ]:
      ensure => directory,
      owner  => 'puppet',
      group  => 'puppet',
      mode   => 400;

    "/etc/puppet/files/openvpn/${server}/download-configs/${name}/${name}.conf":
      ensure  => file,
      owner   => 'puppet',
      group   => 'puppet',
      mode    => 400,
      source  => "/etc/openvpn/${server}/download-configs/${name}/${name}.conf",
      require => File["/etc/puppet/files/openvpn/${server}/download-configs/${name}"];

    "/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys/ca.crt":
      ensure  => file,
      owner   => 'puppet',
      group   => 'puppet',
      mode    => 400,
      source  => "/etc/openvpn/${server}/easy-rsa/keys/ca.crt",
      require => File["/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys"];
      
    "/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys/${name}.crt":
      ensure  => file,
      owner   => 'puppet',
      group   => 'puppet',
      mode    => 400,
      source  => "/etc/openvpn/${server}/easy-rsa/keys/${name}.crt",
      require => File["/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys"];
      
    "/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys/${name}.key":
      ensure  => file,
      owner   => 'puppet',
      group   => 'puppet',
      mode    => 400,
      source  => "/etc/openvpn/${server}/easy-rsa/keys/${name}.key",
      require => File["/etc/puppet/files/openvpn/${server}/download-configs/${name}/keys"];
  }

}