require File.expand_path('../../test_helper', __FILE__)

module Stripe
  class SourceTransactionTest < Test::Unit::TestCase
    setup do
      @source = Stripe::Source.retrieve("src_123")
    end

    should "be listable" do
      transactions = @source.source_transactions

      assert_requested :get,
        "#{Stripe.api_base}/v1/sources/#{@source.id}/source_transactions"
      assert transactions.data.kind_of?(Array)
      assert transactions.first.kind_of?(Stripe::SourceTransaction)
    end
  end
end
