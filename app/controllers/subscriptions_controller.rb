class SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(subscription_params)

    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: subscription.errors
    end
  end

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions

    render json: SubscriptionSerializer.new(subscriptions, include: [:customer, :tea])
  end

  def cancel
    subscription = Subscription.find(params[:id])
    subscription.update(status: 'cancelled')

    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_id)
  end
end