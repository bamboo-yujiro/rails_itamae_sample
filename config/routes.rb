Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace "api", defaults: { format: "json" } do
    namespace "v1" do
      resources :users, only: [:show, :create, :update]
      resources :logins, only: [:create, :destroy]
      post :password_losts, to: "password_losts#create"
      post :email_changes, to: "email_changes#create"
      put :email_changes, to: "email_changes#update"
      resources :api_keys, only: [:create]
      resources :masters, only: :index
      resources :walk_summaries, only: [:index, :create]
      namespace "point" do
        resources :buys, only: [:index, :create]
        resources :visits, only: [:index, :create]
      end
      resources :products, only: [:index, :show]
      resources :product_changes, only: [:create]
      resources :point_histories, only: [:index]
      resources :notifications, only: [:index]
      resources :recent_notifications, only: [:index]
      resources :verify_user_create_tokens, only: :create
    end
  end
end
