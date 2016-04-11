Rails.application.routes.draw do

    namespace :api, path: '/webapp' do
      scope module: 'webapp' do
        resources :condos, only: [:index, :show] do
          resources :measure_processes, only: [:index, :show, :create]
        end
        resources :plots, only: [:show]
        resources :users
        resources :meters, only: [:show]

      end
    end

    namespace :api, path: '/mobileapp' do
      scope module: 'mobileapp' do
        resources :measures, except: [:destroy, :new]
      end
    end
  end
