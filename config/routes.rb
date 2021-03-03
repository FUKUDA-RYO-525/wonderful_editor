Rails.application.routes.draw do
  as :user do
    # Define routes for User within this block.
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace "api" do
    namespace "v1" do
      mount_devise_token_auth_for "User", at: "auth"
      resources :articles
    end
  end
end
