class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :new_task, only: :create
  before_action :set_task, only: [:show, :edit, :destroy]

  def index
    @current_time = Time.now
    user = current_user;
    if user.admin?
      @task = Task.all()
    else 
      @task = Task.where(:user_id =>current_user.id)
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    if @task.save
      redirect_to tasks_index_path, notice: 'Task was successfully created.'
    else
      render :new, @task
    end
  end


  def update
    binding.pry
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_index_path, notice: 'Task was successfully created.'
    else
      render :new, @task
    end
  end

  def delete_tasks
    task = Task.where(id:  params[:id]).first
    task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_index_path, notice: 'Task was successfully deleted.' }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def new_task
      @task = Task.new(task_params)
    end

    def task_params
      params.require(:task).permit(:user_id, :task_name, :task_descriptions, :status, :deadline)
    end

end 
