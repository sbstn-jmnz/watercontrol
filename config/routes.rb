Rails.application.routes.draw do

  constraints subdomain: 'api' do

    namespace :mobilapp, path: '/mobileapp' do
    end

    namespace :api, path: '/webapp' do
      scope module: 'webapp' do
        resources :condos, only: [:index, :show]
        resources :plots
      end
    end

  end
end
