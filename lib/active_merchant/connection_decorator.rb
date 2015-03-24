ActiveMerchant::Connection.class_eval do
  attr_accessor :ciphers

  def configure_ssl(http)
    return unless endpoint.scheme == "https"

    http.use_ssl = true
    http.ssl_version = ssl_version if ssl_version
    http.ciphers = ciphers if ciphers

    if verify_peer
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      http.ca_file     = ca_file
      http.ca_path     = ca_path
    else
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
  end
end
