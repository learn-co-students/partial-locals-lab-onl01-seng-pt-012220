Rails.application.routes.draw do
  root "students#index"
  resources :classrooms
  resources :students
end
