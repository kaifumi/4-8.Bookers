Rails.application.routes.draw do
  
  resources :books
  get "/" => "books#top"
end
