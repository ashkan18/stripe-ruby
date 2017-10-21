require File.expand_path("../../test_helper", __FILE__)

module Stripe
  class ExchangeRatesTest < Test::Unit::TestCase
    should "be listable" do
      # TODO: update this test to use stripe-mock once it supports /v1/exchange_rates
      stub_request(:get, "#{Stripe.api_base}/v1/exchange_rates")
        .to_return(body: JSON.generate(
          object: "exchange_rates",
          data: {
            "eur" => { "gbp" => 0.891864, "usd" => 1.17574 },
            "gbp" => { "eur" => 1.12125, "usd" => 1.3183 },
            "usd" => { "eur" => 0.850525, "gbp" => 0.758553 },
          }
        ))

      r = Stripe::ExchangeRates.list
      assert_requested :get, "#{Stripe.api_base}/v1/exchange_rates"
      assert r.is_a?(Stripe::ExchangeRates)
    end

    should "be retrievable" do
      # TODO: update this test to use stripe-mock once it supports /v1/exchange_rates
      stub_request(:get, "#{Stripe.api_base}/v1/exchange_rates/usd")
        .to_return(body: JSON.generate(
          object: "exchange_rates",
          data: {
            "usd" => { "eur" => 0.850525, "gbp" => 0.758553 },
          }
        ))

      r = Stripe::ExchangeRates.retrieve("usd")
      assert_requested :get, "#{Stripe.api_base}/v1/exchange_rates/usd"
      assert r.is_a?(Stripe::ExchangeRates)
    end
  end
end
