Facter.add("openvpn_client_cert_data") do
  setcode do
    clients = {}
    path = '/etc/openvpn'
    if File.directory?(path)
      Dir.entries(path).each do |server|
        if File.directory?("#{path}/#{server}/download-configs")
          Dir.entries("#{path}/#{server}/download-configs").each do |client|
            if File.directory?("#{path}/#{server}/download-configs/#{client}") and client !~ /^\.\.?$/
              clients["#{server}-#{client}-conf"] = File.open("#{path}/#{server}/download-configs/#{client}/#{client}.conf", "r").read
              clients["#{server}-#{client}-ca"] = File.open("#{path}/#{server}/download-configs/#{client}/keys/ca.crt", "r").read
              clients["#{server}-#{client}-crt"] = File.open("#{path}/#{server}/download-configs/#{client}/keys/#{client}.crt", "r").read
              clients["#{server}-#{client}-key"] = File.open("#{path}/#{server}/download-configs/#{client}/keys/#{client}.key", "r").read
            end
          end
        end
      end
    end
    clients
  end
end