Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/customers/:customer_id/subscriptions', to: 'subscriptions#create'

      patch '/subscriptions/:id/cancel', to: 'subscriptions#cancel'

      get '/customers/:customer_id/subscriptions', to: 'subscriptions#index'
    end
  end
end
