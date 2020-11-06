class ContentsController < ApplicationController
  before_action :set_content, only: [:edit, :show]

  def index
    @contents = Content.includes(:user).order("created_at DESC")
  end

  def show
    
  end

  def edit
  
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
  

  private

  def content_params
    params.require(:content).permit(:text).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
    
  end
 

end
