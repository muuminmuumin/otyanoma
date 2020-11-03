class ContentsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @contents = Content.includes(:user).order("created_at DESC")
  end

  def show
  end

  def new
    @content = Content.new
  end
  

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
 

end
