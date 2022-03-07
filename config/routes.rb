Rails.application.routes.draw do
  resources :events do
    resources :event_tasks
    #resources :children # for calendar view
    #resources :caregivers
    #resources :addresses
  end
  resources :caregivers do
    resources :event_tasks
    #resources :events
    #resources :children
    #resources :addresses
  end
  resources :children do
    resources :event_tasks
    resources :events
    #resources :caregivers
    #resources :addresses
  end
  resources :addresses do
    resources :event_tasks
    resources :events
    resources :caregivers
    resources :children
  end
  resources :event_tasks do
    #resources :addresses
    resources :events # for show task
    #resources :caregivers
    #resources :children
  end
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
