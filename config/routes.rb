Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  namespace :admin do
    resources :writers, only: [:index, :edit, :update]
  end

  devise_for :writer, controllers: {
    sessions:      'writer/sessions',
    passwords:     'writer/passwords',
    registrations: 'writer/registrations'
  }

  root to: 'writer/sessions#new'
end
