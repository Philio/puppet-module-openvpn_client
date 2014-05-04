class openvpn_client::service {

  service { 'openvpn':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true;
  }

}