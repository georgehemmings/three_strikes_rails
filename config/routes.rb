ThreeStrikes::Application.routes.draw do
  resources :strikes
  resources :people

  get "main/index"

  root :to => 'main#index'
end
