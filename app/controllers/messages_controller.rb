class MessagesController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        per_page = params[:per_page] || 20
        render :json => Message.paginate(page: params[:page], per_page: per_page)
      end
    end
  end
  
  def create
    respond_to do |format|
      format.json do
        params.permit!
        message = Message.new(params[:message])
        if message.save
          render :json => { success: true, message: message }
        else
          render :json => { success: false }
        end
      end
    end
  end
  
  def destroy
    
  end
  
  private
    def user_params
      params.require(:message).permit(:author, :email, :content)
    end
end
