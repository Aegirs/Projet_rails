<<<<<<< HEAD
Coloclify::Application.routes.draw do

=======
Projet::Application.routes.draw do
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
  get "messages/index"
  get "messages/show"
  get "acceuil/index"
  get "acceuil/show"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  devise_for :admins
  get "colocations/index"
  get "colocations/show"
  get "colocations/new"
<<<<<<< HEAD
  get "colocation/edit"
  resources :colocations
  resources :messages
  root to: "colocations#index"
 
=======
  
  resources :colocations
  resources :messages
  root to: "colocations#index"
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
end
