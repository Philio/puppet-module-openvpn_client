define openvpn_client::client (
  $server,
) {
  
  include openvpn_client
  Class['openvpn_client::install'] ->
  Openvpn_client::Client[$name] ~>
  Class['openvpn_client::service']
  
  File <<| tag == "${server}-${name}" |>>
  
#  file {
#    "/etc/openvpn/${name}.conf":
#      ensure  => file,
#      owner   => 'root',
#      group   => 'root',
#      mode    => 644,
#      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/${name}.conf";
#
#    "/etc/openvpn/keys/ca.crt":
#      ensure  => file,
#      owner   => 'root',
#      group   => 'root',
#      mode    => 644,
#      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/keys/ca.crt";
#      
#    "/etc/openvpn/keys/${name}.crt":
#      ensure  => file,
#      owner   => 'root',
#      group   => 'root',
#      mode    => 644,
#      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/keys/${name}.crt";
#      
#    "/etc/openvpn/keys/${name}.key":
#      ensure  => file,
#      owner   => 'root',
#      group   => 'root',
#      mode    => 600,
#      source  => "puppet://management.codacity.net/files/openvpn/${server}/download-configs/${name}/keys/${name}.key";
#  }
  
}