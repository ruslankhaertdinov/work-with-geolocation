Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :locations, only: [] do
    get :fetch, on: :collection
  end
  root to: "pages#home"
end
