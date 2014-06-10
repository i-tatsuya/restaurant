Restaurant::Application.routes.draw do
  root to: "top#index"
  match "storemap" => "top#storemap"
  match "personal_info" => "top#personalinfo"
  match "support" => "top#support"
  resources :users,:only => [:new,:create]
  resource :session, :only => [:create,:destroy]
  resource :account, :only => [:show,:edit,:update,:destroy]
  resources :articles, :only => [:index, :show]
  resources :courses, :only => [:index, :show]
  resources :reservations, :only => [:show, :new, :create, :destroy] do
    collection do
      post "new2"
      post "confirm"
    end
  end
  namespace :admin do
    root to: "top#index"
    resources :users, :only => [:index, :show, :destroy] do
      collection { get "search" }
    end
    resources :articles
    resources :courses
    resources :reservations, :only => [:index, :show, :destroy] do
      collection { get "search"}
    end
  end
  match "*anything" => "top#not_found"
end
