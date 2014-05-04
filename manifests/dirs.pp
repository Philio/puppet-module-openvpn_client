define openvpn_client::dirs {

  file {
    [ "/etc/puppet/files/openvpn",
      "/etc/puppet/files/openvpn/${name}",
      "/etc/puppet/files/openvpn/${name}/download-configs" ]:
      ensure => directory,
      owner  => 'puppet',
      group  => 'puppet',
      mode   => 400;
  }

}