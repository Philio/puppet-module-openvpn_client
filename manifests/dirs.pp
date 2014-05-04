define openvpn_client::dirs (
  $server,
) {

  file {
    [ "/etc/puppet/files/openvpn",
      "/etc/puppet/files/openvpn/${server}",
      "/etc/puppet/files/openvpn/${server}/download-configs" ]:
      ensure => directory,
      owner  => 'puppet',
      group  => 'puppet',
      mode   => 400;
  }

}