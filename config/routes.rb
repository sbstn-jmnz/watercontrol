Rails.application.routes.draw do

  constraints subdomain: 'api' do

    namespace :mobileapp, path: '/mobileapp' do

    end

    namespace :api, path: '/webapp' do
      scope module: 'webapp' do
        resources :condos, only: [:index, :show] do
          resources :sectors, only: [:index, :show]
        end
        resources :plots, only: [:show]
        resources :users
        resources :meters, only: [:show] 
        resources :measure_processes, only: [:index, :show, :create]
      end
    end

    namespace :api, path: '/mobileapp' do
      scope module: 'mobileapp' do
        resources :measures, except: [:destroy, :new]
      end

    end

  end
end
