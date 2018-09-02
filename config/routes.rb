Rails.application.routes.draw do
  root "welcome#index"
  post 'cards/:id/add_people', to: 'cards#add_people'
  get 'cards/:id/add_people', to: 'cards#add_people'
  get 'ideas', to: 'cards#ideas'
  get 'actions', to: 'cards#actions'
  resources :cards do
    resources :participants
  end
  get 'categories/list', to: 'categories#list'
  resources :categories
  resources :materials
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
