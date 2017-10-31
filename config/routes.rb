Rails.application.routes.draw do
  root "dashboard#index"

  resources :expenses
  get 'last_six_months', to: "dashboard#last_six_months"
  get 'by_day', to: "dashboard#by_day"
  get 'by_category', to: "dashboard#by_category"
  get 'accumulated', to: "dashboard#accumulated"


    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        resources :expenses, except: [:edit, :new, :show]
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
