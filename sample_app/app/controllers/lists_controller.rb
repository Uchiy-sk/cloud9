class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)  # データを受け取り、インスタンスの作成
    list.save                     # データをdbに保存
    redirect_to '/top'            # top画面にリダイレクト
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private # アクションとURLを非対応にして制限
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
