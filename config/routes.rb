Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'questions#index'


  resources :questions do
    resources :answers, except: [:index, :show, :new]
  end
end
