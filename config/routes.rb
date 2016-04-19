Rails.application.routes.draw do

    namespace :api, path: '/webapp' do
      scope module: 'webapp' do
        resources :condos, only: [:index, :show] do
          resources :measure_processes, only: [:index, :show, :create] do
            match 'close', :on => :member, :via => [:post]
          end
          resources :charge_parameters, only: [:index] do
            collection do
              patch 'update'
            end
          end
          resources :sectors
        end
        resources :plots, only: [:show]
        resources :users, only: [:show, :create, :index]
        resources :meters, only: [:show]
        resources :sessions, only: [:create]
    end
  end

  namespace :api, path: '/mobileapp' do
    scope module: 'mobileapp' do
      resources :users, only: [:show] do
        resources :sector, only: [:index]
      end
      resources :measures, except: [:destroy, :new]
      resources :sessions, only: [:create]
    end
  end

  root :controller => 'static', :action => '/public/index.html'
  get '*path' => 'application#index'

end
