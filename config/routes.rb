Coloclify::Application.routes.draw do

  get "messages/index"
  get "messages/show"
  get "acceuil/index"
  get "acceuil/show"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  devise_for :admins
  get "colocations/index"
  get "colocations/show"
  get "colocations/new"
  get "colocation/edit"
  resources :colocations
  resources :messages
  root to: "colocations#index"
 
end
