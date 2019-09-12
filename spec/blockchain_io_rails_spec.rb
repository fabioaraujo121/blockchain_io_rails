RSpec.describe BlockchainIoRails do
	it "has a version number" do
		expect(BlockchainIoRails::VERSION).not_to be nil
	end

	it "has api key" do
		expect(BlockchainIoRails::configuration::api_key).not_to be nil
	end

	describe "Wallet API" do
		it "create wallet" do
			res = BlockchainIoRails::Api::Wallet::create
			expect(res).to have_key(:guid)
		end

		it "outgoing payment" do
			user = User.first
			to = user.address
			res = BlockchainIoRails::Api::Wallet::outgoing(user, to, 0.001)
			expect(res).to have_key(:tx_hash)
		end

		it "address balance" do
			user = User.first
			res = BlockchainIoRails::Api::Wallet::address_balance(user)
			expect(res).to be_kind_of(String)
		end
	end	
end