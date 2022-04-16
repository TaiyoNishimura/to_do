Rails.application.routes.draw do
  get '/' => 'task#top'
  
  get 'set' => 'task#set'
  get 'index' => 'task#index'
  post 'tasks/:id/clear' => 'task#clear'
  post 'tasks/create' => 'task#create'
  post 'tasks/:id/destroy' => 'task#destroy'
  post 'tasks/:id/set_again' => 'task#set_again'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
