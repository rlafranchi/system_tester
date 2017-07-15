SystemTester::Engine.routes.draw do
  mount ActionCable.server => '/cable'
  resources :features, only: [:index, :create, :update, :destroy], :defaults => {:format => :json}
  resources :scenarios, only: [:index, :show, :create, :update, :destroy], :defaults => {:format => :json}
  resources :steps, only: [:index, :show, :new, :create, :update, :destroy], :defaults => {:format => :json}
  resources :scenario_steps, only: [:create, :update, :destroy], :defaults => {:format => :json}
  resources :stair_steps, only: [:create, :update, :destroy], :defaults => {:format => :json}
  resources :step_types, only: [:index], :defaults => {:format => :json} do
    collection do
      get :parents, :defaults => {:format => :json}
    end
  end
  resources :status, only: [:index], :defaults => {:format => :json}
  resources :executions, only: [:create]
end
