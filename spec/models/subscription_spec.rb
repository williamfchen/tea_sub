require 'rails_helper'

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "associations" do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end
end
