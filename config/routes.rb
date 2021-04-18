Rails.application.routes.draw do

  get 'tasks/index'

  get 'users/index'

  root to: 'home#index'

  devise_for :users
  
  resource :tasks, only: [:create,:update, :new, :delete]
  get 'delete_tasks/:id', to: 'tasks#delete_tasks', as: :delete_tasks
  get 'edit_tasks/:id', to: 'tasks#edit', as: :edit_tasks



end
