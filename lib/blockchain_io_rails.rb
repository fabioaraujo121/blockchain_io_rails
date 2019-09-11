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

  	module Wallet
  		def create(args = {})
  			uri = URI("http://localhost:3000/api/v2/create")
  			pwd = encode_password(generate_password)
            res = Net::HTTP.post_form(uri, 'password' => pwd)
            if res.code == 200
                puts res.body
                {
                    guid: res.body.guid,
                    address: res.body.address,
                    label: res.body.label,
                    password: pwd
                }
            else
                puts "Algo deu errado"
                puts res.body
                false
            end
  		end

  		def outgoing(user, to, amount)
  			satoshi = amount
  			uri = URI("http://localhost:3000/merchant/" + user.guid + "/payment")
            res = Net::HTTP.post_form(uri, 'password' => decode_password(user.wallet_password), 'to' => to, 'amount' => satoshi)
            if res.code == 200
                puts res.body
                {
                    message: res.body.message,
                    tx_hash: res.body.tx_hash,
                    notice: res.body.notice
                }
            else
                puts "Algo deu errado"
                puts res.body
                false
            end
  		end

  		def address_balance(user, address = nil)
  			address ||= user.wallet
  			uri = URI("http://localhost:3000/merchant/" + user.guid + "/address_balance?password=" + decode_password(user.wallet_password) + "&address=" + address)
			Net::HTTP.get(uri)
  		end
  	end

  	private
  		def encode_password(pwd)
  			crypt = ActiveSupport::MessageEncryptor.new(BlockchainIoRails.configuration.secret_key)
  			crypt.encrypt_and_sign(pwd)
  		end
  		def decode_password(pwd)
  			crypt = ActiveSupport::MessageEncryptor.new(BlockchainIoRails.configuration.secret_key)
  			crypt.decrypt_and_verify(pwd)
  		end
  		def generate_password
  			SecureRandom.hex(32)
  		end
end
