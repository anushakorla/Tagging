Rails.application.routes.draw do
  
  root 'posts#index'
  resources :posts do
  	get :cancel, on: :collection
  end
  get 'tags/:tag', to: 'posts#index', as: "tag"
end

