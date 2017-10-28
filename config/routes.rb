Rails.application.routes.draw do
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create] do
    resources :proposals, shallow: true
  end

  resources :owners do
    collection do
      get 'login'
      post 'authenticate'
    end
  end
end
