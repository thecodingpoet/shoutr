class ShoutsController < ApplicationController
  def create 
    shout = current_user.shouts.create(shouts_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  def show 
    @shout = Shout.find(params[:id])
  end

  private

  def shouts_params
    { content: content_from_params }
  end

  def content_from_params
    TextShout.new(content_params)
  end

  def content_params 
    params.require(:shout).require(:content).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: "Shouted Successfully" }
    else 
      { alert: "Could not shout"}
    end
  end
end
