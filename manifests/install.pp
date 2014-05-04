class openvpn_client::install {
  
  ensure_packages(['openvpn'])

  file { ['/etc/openvpn', '/etc/openvpn/keys']:
    ensure  => directory,
    require => Package['openvpn'];
  }

}