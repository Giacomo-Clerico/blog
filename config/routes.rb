Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post # blog post creation page
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post # singular post visualization page
  patch "/blog_posts/:id", to: "blog_posts#update" # patch request to update database entry
  get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post # blog post edit page
  post "/blog_posts", to: "blog_posts#create", as: :blog_posts # post request to save to database

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "blog_posts#index"
end
