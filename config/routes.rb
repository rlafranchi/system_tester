TudeTester::Engine.routes.draw do
  get 'feature/index'

  namespace :tude_tester do
    get 'features/index'
  end

  resources :features
end
