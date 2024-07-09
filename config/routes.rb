Rails.application.routes.draw do

  # URL =>コントローラ#アクションの結び付け
  get 'lists/new'
  get 'lists' => 'lists#index'
  # 'lists/:id'にlistという名前を付ける
  get 'lists/:id' => 'lists#show',as: 'list'
  # 表示機能'lists/:id/edit'にedit_listという名前を付ける
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  post 'lists' => 'lists#create'
  get '/top' => 'homes#top'
  # 'lists/:id'の更新機能にupdate_listという名前を付ける
  patch 'lists/:id' => 'lists#update', as: 'update_list'
  # 'lists/:id'の削除機能にupdate_listという名前を付ける
  delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
