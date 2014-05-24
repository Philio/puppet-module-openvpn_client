define openvpn_client::import (
  $server,
) {
  
  include openvpn_client
  Class['openvpn_client::install'] ->
  Openvpn_client::Import[$name] ~>
  Class['openvpn_client::service']
  
  File <<| tag == "${server}-${name}" |>>
  
}