SystemTester::Engine.routes.draw do
  resources :features, only: [:index, :create, :update, :destroy]
  resources :scenarios, only: [:index, :show, :create, :update, :destroy]
  resources :steps, only: [:index, :show, :new, :create, :update, :destroy]
  resources :scenario_steps, only: [:create, :update, :destroy]
  resources :stair_steps, only: [:create, :update, :destroy]
  resources :step_types, only: [:index] do
    collection do
      get :parents
    end
  end
  resources :status, only: [:index]
end
