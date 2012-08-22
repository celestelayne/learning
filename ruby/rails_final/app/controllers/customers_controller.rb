class CustomersController < ApplicationController
  respond_to :html, :json, :xml
  
  def index
    @customers = Customer.all
    respond_with(@customers)
  end
  
  def show
    @customer = Customer.find(params[:id])
    @customer_orders = Order.find_all_by_customer_id(@customer.id)
    respond_with(@customer)
  end
  
  def new
    @customer = Customer.new
    respond_with(@customer)
  end
  
  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      respond_with(@customer) do |format|
        format.html do |f|
          flash[:success] = "Welcome to Magic Johnson's Order tracker!"
          redirect_to @customer
        end
      end
    else
      flash.now[:error] = "Something went wrong :("
      render action: :new
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
    respond_with (@customer)
  end
  
  def update
    @customer = Customer.find(params[:id])
    
    respond_with(@customer) do |format|
      if @customer.update_attributes(params[:customer])
        format.html do |f|
          flash[:success] = "Profile updated"
          @customer.save
          redirect_to @customer
        end
      else
        flash.now[:error] = "Not Updated! Aww Man!"
      end
    end
  end
  
  def destroy
  end
  
end