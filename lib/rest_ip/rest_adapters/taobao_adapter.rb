require 'faraday'
require 'json'

module RestIP
  module RestAdapters
    class TaobaoAdapter
      class << self
        def query(ip)
          conn = Faraday.new(url: 'http://ip.taobao.com') do |faraday|
            faraday.request  :url_encoded             # form-encode POST params
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          end

          response = conn.get do |req|
            req.url '/service/getIpInfo.php', { ip: ip }
            req.options.timeout = 10
            req.options.open_timeout = 5
          end

          return if response.status != 200

          response_hash = JSON.parse response.body

          return unless response_hash['code'].zero?

          RestIP::Result.new.tap do |result|
            result.area       = response_hash['data']['area']
            result.area_id    = response_hash['data']['area_id']
            result.city       = response_hash['data']['city']
            result.city_id    = response_hash['data']['city_id']
            result.country    = response_hash['data']['country']
            result.country_id = response_hash['data']['country_id']
            result.region     = response_hash['data']['region']
            result.region_id  = response_hash['data']['region_id']
            result.isp        = response_hash['data']['isp']
            result.isp_id     = response_hash['data']['isp_id']
            result.ip         = response_hash['data']['ip']
          end
        end
      end
    end
  end
end
