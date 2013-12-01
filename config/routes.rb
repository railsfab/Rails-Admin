RailsfabAdmin::Engine.routes.draw do
  get "admin/" => "admin#index", as: :admin
  #get "admin/:model_name/new" => "admin#new", as: :new_record
  post "admin/:table" => "admin#create"
  get "admin/:table/new" => "admin#new", as: :new_record
  get "admin/:table/:id" => "admin#show_record", as: :show_record
  get "admin/:table/:id/edit" => "admin#edit", as: :edit_record
  patch "admin/:table/:id/" => "admin#update"
  get "admin/:table" => "admin#show", as: :show_records

end
