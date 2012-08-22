class ListsController < ApplicationController
  respond_to :html, :json, :xml
  
  def index
    respond_with(@lists = List.all)
  end
  
  def new
   respond_with(@list = List.new)
  end
 
#  url: protocol://base/route?parameters
#  params[:list][:title]
  
  def create
    @list = List.new(params[:list])
    
    if (@list.save)
      # then it'll do this branch
      respond_with(@list) do |format|
        format.html do |f|
          flash[:success] = "Yabadabadooooooo!!!"
          redirect_to new_list_task_path(@list)
        end
      end
    else
      # then we need to do all sorts of something
      flash.now[:error] = "That dun broke!!"
      render action: :new
    end
  end
  
  def show
    respond_with(@list = List.find(params[:id]))
  end
  
  def edit
    respond_with(@list = List.find(params[:id]))
  end
  
  def update
    @list = List.find(params[:id])
    # They 
    respond_with(@list) do |format|
      if @list.update_attributes(params[:list]) 
        format.html do |f|
          flash[:success] = "UPDATED LIST ! BOOM!"
          @list.save
          redirect_to list_path
        end
      else
        flash.now[:error] = "NOT UPDATED! Aww Man!"
        render action: :edit
      end
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    
    if @list.destroy
      flash[:success] = "THERE SHE GOES!!!!!! Deleted ;)"
    else
      flash[:error] = "AWw healll naww."
    end
    
    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.any(:json) {render json: true}
    end
    
  end
end
