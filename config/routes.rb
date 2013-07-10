Bbs::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
