class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)    # データを受け取り、インスタンスの作成
    list.save                       # データをdbに保存
    redirect_to list_path(list.id)  # list/:id画面にリダイレクト
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])  # [:id]番目の要素を取得
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private # アクションとURLを非対応にして制限
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
