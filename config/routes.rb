
Coloclify::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_for :admins
  
  resources :comptes
  resources :colocations
  resources :messages
  resources :messages
  resources :acceuil
  root to: "colocations#index"
 
end
