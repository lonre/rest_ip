require 'rest_ip/querying'
require 'rest_ip/rest_adapter'
require 'rest_ip/result'
require 'rest_ip/version'

module RestIP
  extend RestAdapter

  extend Querying
end
