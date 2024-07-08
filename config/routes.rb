Rails.application.routes.draw do

  # URL =>コントローラ#アクションの結び付け
  get 'lists/new'
  get 'lists' => 'lists#index'
  # 'lists/:id'にlistという名前を付ける
  get 'lists/:id' => 'lists#show',as: 'list'
  # 'lists/:id/edit'にedit_listという名前を付ける
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  post 'lists' => 'lists#create'
  get '/top' => 'homes#top'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
