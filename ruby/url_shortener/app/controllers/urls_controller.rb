class UrlsController < ApplicationController
    
  def show
    @url = Url.find(params[:id])
  end
  
  def new
    @url = Url.new
  end
  
  def create
    @url = Url.new(params[:url])
    
    if current_user != nil
      @url.user_id = current_user.id
    end
    
    if ! params[:url][:vanity_url].blank?
      @url.shortened_url = params[:url][:vanity_url]
    else  
      @url.shorten_url
    end
    
    if @url.save
      redirect_to @url
    else
      render 'new'
    end    
  end

  def destroy
    @url = Url.find(params[:id])
    if @url.user_id == current_user.id
      @url.delete
      flash[:success]= "Link Deleted"
      redirect_to root_path
    else
      flash[:error] = "You do not have permission to delete that link son."
      redirect_to "/users/#{Url.find(params[:id]).user_id}"
    end
  end
  
  def redirect
    url = Url.find_by_shortened_url(params[:shortened_url])
    final_url = url.original_url
    redirect_to final_url
  end
  
end
