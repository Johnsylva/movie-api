Rails.application.routes.draw do
 get "/actors" => "actors#index"
 get "/actors/:id" => "actors#show"
 post "/actors" => "actors#create"
 put "/actors/:id" => "actors#update"
 delete "/actors/:id" => "actors#destroy"
end
