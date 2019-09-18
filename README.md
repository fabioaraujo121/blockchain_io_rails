# BlockchainIoRails

This is an unofficial integration gem. You should read the [Blockchain.io](https://www.blockchain.com/pt/api/).
Moving on, to use this gem you should understand first how the Blockchain.io API works.
You have to run their application in the same machine of yours. [Read more to understand](https://github.com/blockchain/service-my-wallet-v3#getting-started).


## Installation

1. Add this line to your application's Gemfile:

```ruby
gem 'blockchain_io_rails'
```

2. Run  `bundle install`

3. Run `rails generate blockchain_io_rails:install`

4. And then execute to install the Blockchain.io app:

    $ npm install -g blockchain-wallet-service

## Usage

**Any Error will throw an Exception**

1. Run the blockchain service `$ blockchain-wallet-service start --port 3000`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fabioaraujo121/blockchain_io_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BlockchainIoRails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/blockchain_io_rails/blob/master/CODE_OF_CONDUCT.md).

## TODO

Fallowing the Blockchain.io API documentation for the **Wallet**:

- [X] Wallet::Create Wallet API (BlockchainIoRails::Wallet::create)
- [X] Wallet::Making Outgoing Payments (BlockchainIoRails::Wallet::outgoing)
- [X] Wallet::Getting the balance of an address (BlockchainIoRails::Wallet::address_balance)
- [ ] Wallet::Send Many Transactions
- [ ] Wallet::Fetching the wallet balance
- [ ] Wallet::Listing Addresses
- [ ] Wallet::Generating a new address
- [ ] Wallet::Address Management::Archiving an address
- [ ] Wallet::Address Management::Unarchive an address