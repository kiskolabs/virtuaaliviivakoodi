# Virtuaaliviivakoodi

Virtuaaliviivakoodi is a library for generating Pankkiviivakoodi of The Federation of Finnish Financial Services ("Finnish bank transfer barcode"). Implementation has been done following [the specification](http://www.finanssiala.fi/maksujenvalitys/dokumentit/Pankkiviivakoodi-opas.pdf).

The library supports both current versions of Pankkiviivakoodi, version 4 (reference number in national form) and version 5 (reference number in international form, aka Creditor Reference based on ISO 11649).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "virtuaaliviivakoodi"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install virtuaaliviivakoodi

## Usage

```ruby
Virtuaaliviivakoodi.generate({
  iban: "FI37 1590 3000 0007 76",
  reference: 11112,
  amount: 12.25,
  due_date: "161221"
}) #=> "437159030000007760000122500000000000000000011112161221"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kiskolabs/virtuaaliviivakoodi.

## Thanks

Akseli Nurmio for his JavaScript library [virtuaaliviivakoodi](https://github.com/akselinurmio/virtuaaliviivakoodi) from which this library has borrowed bunch of test cases.
