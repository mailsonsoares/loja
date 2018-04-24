Rails.application.routes.draw do
  
  resources :departamentos
	#get "produtos" => "listaprodutos#index"
	resources :produtos, only: [:new, :create, :destroy, :edit, :update]
	root "produtos#index"
	get "/produtos/busca" =>"produtos#busca", as: :busca_produto
	#get "/produtos/new" => "listaprodutos#new"
	#post "/produtos" => "listaprodutos#create"
	#delete "/produtos/:id" => "listaprodutos#destroy", as: :produto
end
