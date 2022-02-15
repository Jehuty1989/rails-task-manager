class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(clean_task)

    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(clean_task_update)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def clean_task
    params.require(:task).permit(:title, :details)
  end

  def clean_task_update
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
