module Spree
  class Gateway::GlobalCollect < Gateway
    preference :login, :string

    def provider_class
      ActiveMerchant::Billing::GlobalCollect
    end
  end
end
