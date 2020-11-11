class ContentsController < ApplicationController
  before_action :set_content, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @contents = Content.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @content.comments.includes(:user).order("created_at DESC")
  end

  def edit
  end

  def update
    content = Content.find(params[:id])
    if content.update(content_params)
      redirect_to contents_path(params[:id]), notice: "テキストを変更しました"
    else
      contents = Content.includes(:user)
      flash.now[:alert] = "変更できませんでした。もう一度お試しください"
      render "edit"
    end

  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to contents_path(@content.id), notice: "メッセージが送信されました"
    else
      @contents = Content.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  def destroy
    content = Content.find(params[:id])
    if content.destroy
      redirect_to contents_path(params[:id]), notice: "削除しました"
    else
      flash.now[:alert] = "失敗しました。再度お試しください"
      render :show
    end
  end

  def search
    @contents = Content.search(params[:keyword])
    @keyword = params[:keyword] #検索した文字列を代入
  end

  private

  def content_params
    params.require(:content).permit(:text).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
 

end
