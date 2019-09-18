BlockchainIoRails.configure do |config|
	# Blockchain.io API Key
	config.api_key = "Your API key here"
	
	# secret_key is the key to generate the encodedes wallet passwords
	# Don't change this after start using, once the password generated with the old secret_key will not be able to decode.
	# Don't change this after start using
	# This MUST be a 32 char string
    config.secret_key = "Your secret key here"
end