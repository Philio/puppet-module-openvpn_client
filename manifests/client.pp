define openvpn_client::client (
  $server,
) {
  
  include openvpn_client
  Class['openvpn_client::install'] ->
  Openvpn_client::Client[$name] ~>
  Class['openvpn_client::service']
  
  file {
    "/etc/openvpn/${name}.conf":
      owner   => 'root',
      group   => 'root',
      mode    => 644,
      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/${name}.conf";

    "/etc/openvpn/keys/ca.crt":
      owner   => 'root',
      group   => 'root',
      mode    => 644,
      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/keys/ca.crt";
      
    "/etc/openvpn/keys/${name}.crt":
      owner   => 'root',
      group   => 'root',
      mode    => 644,
      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/keys/${name}.crt";
      
    "/etc/openvpn/keys/${name}.key":
      owner   => 'root',
      group   => 'root',
      mode    => 600,
      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/keys/${name}.key";
  }
  
}