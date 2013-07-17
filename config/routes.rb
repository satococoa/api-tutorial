Bbs::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'rails_admin/main#dashboard'

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create, :update, :destroy]
    end
  end
end
