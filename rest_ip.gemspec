# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rest_ip/version'

Gem::Specification.new do |spec|
  spec.name          = 'rest_ip'
  spec.version       = RestIP::VERSION
  spec.authors       = ['Lonre Wang']
  spec.email         = ['me@wanglong.me']
  spec.summary       = %q{Query IP address location based on various online restful services.}
  spec.description   = %q{Query IP address location based on various online restful services. Such as ip.taobao.com, sina iplookup... }
  spec.homepage      = 'https://github.com/lonre/rest_ip'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
