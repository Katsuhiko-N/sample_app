class ListsController < ApplicationController
  def new
    # Viewファイルに渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create
    # 1.&2.データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #3.データをdbへ保存するためのsaveメソッド実行
    list.save
    # 4.トップ画面へリダイレクト
    # redirect_to '/top'を書き換え
    redirect_to list_path(list.id)
  end

  def index
    # Listから全てを取り出す
    @lists = List.all
  end

  def show
    # Listからidに応じたものを取り出す
    @list = List.find(params[:id])
  end

  def edit
    # Listからidに応じたものを取り出す
    @list = List.find(params[:id])
  end

  def update
    # Listからidに応じたものを取り出す
    list = List.find(params[:id])
    # 取り出したものを書き換え
    list.update(list_params)
    # 各詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def destroy
    # Listからidに応じたものを取り出す
    list = List.find(params[:id])
    # 取り出したものを消去
    list.destroy
    # 一覧画面へリダイレクト
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body, :image)
  end

end
