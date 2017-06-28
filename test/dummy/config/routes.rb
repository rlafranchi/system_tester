Rails.application.routes.draw do
  resources :examples
  mount SystemTester::Engine => "/system_tester"
end
