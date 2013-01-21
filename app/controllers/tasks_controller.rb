class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:complete, :destroy]

  def index
    @tasks = Task.where(user_id: current_user.id).order('id DESC')
  end

  def create
    @task = current_user.tasks.create(params[:task])
  end

  def destroy
    @task.destroy
  end

  def complete
    @task.complete!
  end

  protected

  def find_task
    @task = current_user.tasks.find(params[:id])
  end
end
