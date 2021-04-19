Rails.application.routes.draw do
  resources :users do
    resources :bank_accounts
    member do
      post 'invest', to: 'investments#invest'
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#signup'
end
