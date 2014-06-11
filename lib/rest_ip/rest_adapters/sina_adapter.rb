require 'faraday'
require 'json'

module RestIP
  module RestAdapters
    class SinaAdapter
      class << self
        def query(ip)
          conn = Faraday.new(url: 'http://int.dpool.sina.com.cn') do |faraday|
            faraday.request  :url_encoded             # form-encode POST params
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          end

          response = conn.get do |req|
            req.url '/iplookup/iplookup.php', { ip: ip, format: 'json' }
            req.options.timeout = 10
            req.options.open_timeout = 5
          end

          return if response.status != 200

          response_hash =
            begin
              JSON.parse response.body
            rescue
              return
            end

          return unless response_hash['ret'] == 1

          RestIP::Result.new.tap do |result|
            result.area       = nil
            result.area_id    = nil
            result.city       = response_hash['city']
            result.city_id    = response_hash['city']
            result.country    = response_hash['country']
            result.country_id = response_hash['country']
            result.region     = response_hash['province']
            result.region_id  = response_hash['province']
            result.isp        = response_hash['isp']
            result.isp_id     = response_hash['isp']
            result.ip         = ip
          end
        end
      end
    end
  end
end
