Rails.application.routes.draw do
  constraints subdomain: 'api' do
    namespace :mobilapp do
      resources :
      resources :condos, only: [:index, :show]
    end
    namespace :webapp do
      resources :condos, except: :destroy
    end
  end
end
