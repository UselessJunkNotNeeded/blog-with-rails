Rails.application.routes.draw do
  get "/users/:user_id/posts" to: "posts#index"
  get "/users/:user_id/posts/:id" to: "posts#show"
  get "/users" to: "users#index"
  get "/users/:id/posts/:id" to "users#show"
end
