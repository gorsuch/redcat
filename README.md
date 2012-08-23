# Redcat

Cat a file (or `stdin`) to a Redis list.

## Installation

Add this line to your application's Gemfile:

    gem 'redcat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redcat

## Usage

```bash
# send a file to a list
$ redcat -l somelist somefile.txt

# pipe a stream to a list
$ tail -f /var/log/messages | redcat -l logs
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
