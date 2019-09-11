class BlockchainIoRails::Generators::InstallGenerator < Rails::Generators::Base
	desc "Generating the BlockchainIonRails initializer file at config/initializers"
  	source_root File.expand_path('templates', __dir__)
  	def copy_initializer_file
    	template 'blockchain_io_rails_initializer.rb', 'config/initializers/blockchain_io_rails.rb'
    	puts "Install complete!\nEnjoy and have fun!\nRemember to read the docs and the config/initializers/blockchain_io_rails.rb"
  	end
end