module Stripe
  class ExchangeRates < APIResource
    extend Stripe::APIOperations::List

    OBJECT_NAME = "exchange_rates".freeze

    def self.resource_url
      "/v1/exchange_rates"
    end
  end
end
