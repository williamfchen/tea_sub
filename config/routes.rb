Rails.application.routes.draw do
  post '/customers/:customer_id/subscriptions', to: 'subscriptions#create'
  patch '/subscriptions/:id/cancel', to: 'subscriptions#cancel'
  get '/customers/:customer_id/subscriptions', to: 'subscriptions#index'
end
