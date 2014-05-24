define openvpn_client::client (
  $server,
) {
  
  include openvpn_client
  Class['openvpn_client::install'] ->
  Openvpn_client::Client[$name] ~>
  Class['openvpn_client::service']
  
  File <<| tag == "${server}-${name}" |>>
  
}