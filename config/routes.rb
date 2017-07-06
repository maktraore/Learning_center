Rails.application.routes.draw do

  get "/surveys", to:'surveys#index'
  # get "/index", to:'employees#index'
  post "/surveys", to: 'surveys#create'
  get "/surveys/results", to: 'surveys#show'

  root  'employees#index', as: 'home'  
  namespace :api do 
    namespace :v1 do 
      resources :employees
    end
  end
  resources :employees do
    resources :schedules
  end
  resources :locations
  resources :subjects
  resources :time_slots
  resources :campus_employees
  resources :campus_subjects
  resources :employee_subjects
  resources :employee_time_slots
  # post "/employees/:employee_id/schedules/new", to:'schedules#create'
  get "/login", to:'sessions#new'
  post "/login", to:'sessions#create'
  get "/logout", to: 'sessions#destroy'
  get "/newpassword", to: 'sessions#edit'
  post "/newpassword", to: 'sessions#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
