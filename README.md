# RestIP [![Build Status](https://travis-ci.org/lonre/rest_ip.png?branch=master)](https://travis-ci.org/lonre/rest_ip)

Query IP address location based on various online restful services.

## Installation

Add this line to your application's Gemfile:

    gem 'rest_ip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rest_ip

## Usage

1. Config with:

    ```ruby
    # available adapters :taobao, :sina
    RestIP.rest_adapter = :taobao
    ```
2. Use as below:

    ```ruby
    # RestIP::Result
    result = RestIP.query('114.114.114.114')
    result.country  # 中国
    result.region   # 江苏省
    result.city     # 南京市
    ```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rest_ip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
