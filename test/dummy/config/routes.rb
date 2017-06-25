Rails.application.routes.draw do
  resources :examples
  mount TudeTester::Engine => "/tude_tester"
end
