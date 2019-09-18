require "blockchain_io_rails/version"
require "net/http"
require 'active_support'

module BlockchainIoRails
  	class Error < StandardError; end
  	class << self
       	attr_accessor :configuration
        def configure
        	self.configuration ||= Configuration.new
         	yield(configuration)
       	end
    end

    class Configuration
        attr_accessor :api_key, :secret_key

        def initialize
            @api_key = 'api_key should be at your initializer'
            @secret_key = 'secret_key should be at your initializer'
        end
    end

  	protected
  		def self.encode_password(pwd)
  			crypt = ActiveSupport::MessageEncryptor.new(BlockchainIoRails.configuration.secret_key)
  			crypt.encrypt_and_sign(pwd)
  		end
  		def self.decode_password(pwd)
  			crypt = ActiveSupport::MessageEncryptor.new(BlockchainIoRails.configuration.secret_key)
  			crypt.decrypt_and_verify(pwd)
  		end
  		def self.generate_password
  			SecureRandom.hex(32)
  		end
end

require 'api/wallet'