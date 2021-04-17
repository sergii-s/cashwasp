Rails.application.routes.draw do
  resources :users do
    resources :bank_accounts
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#signup'
end
