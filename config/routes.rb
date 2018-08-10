Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cocktails#index"
  resources :bars do
    resources :cocktails
  end
  resources :cocktails do
    resources :doses
  end
  resources :doses
end
