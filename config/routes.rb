RailsfabAdmin::Engine.routes.draw do
  get "admin/" => "admin#index", as: :admin
  #get "admin/:model_name/new" => "admin#new", as: :new_record
  #post "admin/:model_name" => "admin#create"
  get "admin/:table/:id" => "admin#show_record", as: :show_record
  get "admin/:table" => "admin#show", as: :show_records
end
