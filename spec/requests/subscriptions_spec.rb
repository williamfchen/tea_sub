require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  let!(:customer) { Customer.create!(first_name: "Will", last_name: "Doe", email: "will@will.com", address: "454 Denver St") }

  let!(:tea) { Tea.create!(title: "Oolong Tea", description: "Great tasting tea", temperature: "80°C", brew_time: "3 minutes") }

  before do
    @subscription1 = Subscription.create!(title: "Monthly Tea", price: "10.00", status: "active", frequency: "monthly", customer: customer, tea: tea)
    @subscription2 = Subscription.create!(title: "Weekly Tea", price: "15.00", status: "active", frequency: "weekly", customer: customer, tea: tea)
  end

  describe "GET /index" do
    before do
      get "/customers/#{customer.id}/subscriptions"
    end

    it "returns a success response" do
      expect(response).to have_http_status(:success)
    end

    it "returns all subscriptions for the customer" do
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "returns subscriptions with the correct attributes" do
      json = JSON.parse(response.body)
      expect(json).to have_key("data")
      expect(json["data"]).to be_an(Array)
      expect(json["data"].first["attributes"]).to have_key("title")
      expect(json["data"].first["attributes"]).to have_key("price")
      expect(json["data"].first["attributes"]).to have_key("status")
      expect(json["data"].first["attributes"]).to have_key("frequency")
      expect(json).to have_key("included")
      expect(response.content_type).to include("application/json")
    end
  end

  describe "POST /create" do
    let(:valid_attributes) {
      { title: "Bi-Weekly Tea", price: "12.00", status: "active", frequency: "bi-weekly", tea_id: tea.id }
    }
  
    context "with valid parameters" do
      it "creates a new Subscription" do
        expect {
          post "/customers/#{customer.id}/subscriptions", params: valid_attributes 
        }.to change(Subscription, :count).by(1)
      end
  
      it "renders a JSON response with the new subscription" do
        post "/customers/#{customer.id}/subscriptions", params: valid_attributes 
        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body)
        expect(json).to have_key("data")
        expect(json["data"]).to have_key("attributes")
        expect(json["data"]["attributes"]).to have_key("title")
        expect(json["data"]["attributes"]).to have_key("price")
        expect(json["data"]["attributes"]).to have_key("status")
        expect(json["data"]["attributes"]).to have_key("frequency")
        expect(json).to have_key("included")
        expect(response.content_type).to include("application/json")
      end
    end
  end
 
  describe "PATCH /cancel" do
    context "when the subscription exists" do
      it "updates the status of the subscription" do
        patch "/subscriptions/#{@subscription1.id}/cancel"
        @subscription1.reload
        expect(@subscription1.status).to eq('cancelled')
      end

      it "renders a JSON response with the updated subscription" do
        patch "/subscriptions/#{@subscription1.id}/cancel"
        expect(response).to be_successful
        expect(response.content_type).to include("application/json")
      end
    end
  end
end
