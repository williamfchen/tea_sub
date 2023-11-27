require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:subscriptions) }
    it { should have_many(:teas).through(:subscriptions) }
  end
end
