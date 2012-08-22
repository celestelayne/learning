class OrdersController < ApplicationController
  respond_to :html, :json, :xml
  
  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    @order = Order.find(params[:id])
    respond_with(@order)
  end

  def new
    @order = Order.new 
    respond_with(@order)
  end

  # Don't worry about these.
  def create
    @order = Order.new(params[:order])
    @customer = Customer.find(@order.customer_id)
    flash[:success] = "Welcome to Magic Johnson's Order tracker!" if @order.save
    
    respond_to do |format|
      format.html { redirect_to customer_path(@customer) }
      format.any(:json) {render json: @order.to_json }
    end
  end

  def edit
    @order = Order.find(params[:id])
    respond_with(@order)
  end

  def update
    @order = Order.find(params[:id])
    
    respond_wth(@order) do |format|
      if @order.update_attributes(params[:order]) 
        format.html do |f|
          flash[:success] = "Great Success!"
          redirect_to @order
        end
      else
        flash.now[:error] = "NOPE"
        render action: :edit
    end
  end
  
  # Don't worry about this one just yet
  def destroy
  end
end
