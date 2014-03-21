
Coloclify::Application.routes.draw do

  devise_for :users
  devise_for :admins
 
  resources :comptes
  resources :colocations do 
    resources :photos
  end
  resources :messages
  resources :acceuil
  root to: "colocations#index"
 
end
