class TasksController < ApplicationController
  respond_to :html, :json, :xml
  
  # get_list returns properly scoped @list
  # get_list_task returns a properly scoped @task

  def index
   get_list
   @tasks = @list.tasks
   respond_with(@tasks)
  end
  
  def new
   get_list
   @task = @list.tasks.new
   respond_with(@task)
  end
  
  def create
    get_list
    @task = @list.tasks.new(params[:task])

    flash[:notice] = "Task created." if @task.save

    respond_to do |format|
      format.html { redirect_to list_path(@list)}
      format.any(:json) { render json: @task.to_json }
    end
  end

  def show    
    get_list_task 
    respond_with(@task)
  end
  
  def edit
    get_list_task
    respond_with(@task)
  end
  
  def update
    get_list_task
    respond_with(@task) do |format|
      if @task.update_attributes(params[:task])
        format.html do |f|
          flash[:success] = "GREAT SUCCESS"
          redirect_to list_task_path
        end
      else
        flash.now[:error] = "NOPE"
        render action: :edit
      end
    end
  end
  
  def destroy
    get_list_task
    
    if @task.destroy
      flash[:success] = "HERE COMES THE BOOM!! ..destroyed.."
    else
      flash[:error] = "Didn't work."
    end
    
    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.any(:json) {render json: true }
    end
  end
  
  private

    def get_list_task
      # @list = List.find(params[:list_id])
      get_list
      @task = @list.tasks.find(params[:id])
    end
    
    def get_list 
      @list = List.find(params[:list_id])
    end  
end
