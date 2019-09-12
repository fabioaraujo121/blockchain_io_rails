class BlockchainIoRails::Api::Wallet
    def self.create(args = {})
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

    def self.outgoing(user, to, amount)
        satoshi = amount # Amount is in Satoshi or in Bitcoin??
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

    def self.address_balance(user, address = nil)
        address ||= user.wallet
        uri = URI("http://localhost:3000/merchant/" + user.guid + "/address_balance?password=" + decode_password(user.wallet_password) + "&address=" + address)
        Net::HTTP.get(uri)
    end
end