class openvpn_client::setup {

  file { "/etc/puppet/files/openvpn":
    ensure => directory,
    owner  => 'puppet',
    group  => 'puppet',
    mode   => 400
  }

}