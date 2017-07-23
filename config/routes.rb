Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
      patch "/messages", to: 'messages#update'
    end
  end
  mathjax 'mathjax'
  get "/manhattan", to:'employees#manhattan_schedule_pdf'
  get "/bronx", to:'employees#bronx_schedule_pdf'
  get "/dobbs_ferry", to:'employees#dobbs_ferry_schedule_pdf'
  get "/york_town", to:'employees#york_town_schedule_pdf'
  get "/online", to:'employees#online_schedule_pdf'
  # get "/messages", to: "messages#index"
  get "/contact", to: 'messages#new_email'
  post "/new_email", to: 'messages#create_email'

  get "/students/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/students/login", to: "sessions#new"
  post "/students/login", to: "sessions#create"
  get "/students/logout", to: "sessions#destroy"

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
  resources :rooms, except: [:edit, :update, :destroy] 
  resources :messages, only: [:index, :create, :show]

  resources :chatrooms, only: [:show, :create]
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
  get "/photos", to: 'photos#new'
  post "/photos", to: 'photos#create'
  get "/photos", to: 'photos#edit'
  patch "/photos", to: 'photos#update'

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
