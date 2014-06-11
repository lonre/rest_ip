module RestIP
  module Querying
    def query(ip)
      rest_adapter.query ip
    end
  end
end
