module BlockchainIoRails
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path('../templates', __dir__)

			desc "Generating the BlockchainIonRails initializer file at config/initializers"
		  	
		  	def copy_initializer
		    	template "blockchain_io_rails.rb", "config/initializers/blockchain_io_rails.rb"

		    	puts "Install complete!\nEnjoy and have fun!\nRemember to read the docs and the config/initializers/blockchain_io_rails.rb"
		  	end
		end
  	end
end