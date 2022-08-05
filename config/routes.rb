Rails.application.routes.draw do
  devise_for :users

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer',to: 'answer#question'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    #resources :admins, only: [:index, :edit, :update, :new, :create]
    resources :admins # Administradores
    resources :subjects
    resources :questions
  end
  devise_for :admins, skip: [:registrations]

  get 'welcome/index'

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
