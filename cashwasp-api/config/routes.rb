Rails.application.routes.draw do
  resources :users do
    resources :bank_accounts
  end
end
