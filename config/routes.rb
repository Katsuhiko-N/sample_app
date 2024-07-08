Rails.application.routes.draw do

  # URL =>コントローラ#アクションの結び付け
  get 'lists/new'
  get 'lists' => 'lists#index'
  # 'lists/:id'にlistという名前を付ける
  get 'lists/:id' => 'lists#show',as: 'list'
  # 表示'lists/:id/edit'にedit_listという名前を付ける
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  post 'lists' => 'lists#create'
  get '/top' => 'homes#top'
  # 更新機能'lists/:id'にupdate_listという名前を付ける
  patch 'lists/:id' => 'lists#update', as: 'update_list'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
