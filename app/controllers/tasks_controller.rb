class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:complete, :destroy]

  def index
    @tasks = current_user.tasks.search(sort_by, direction)
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

  private

  def find_task
    @task = current_user.tasks.find(params[:id])
  end

  def sort_by
    params[:sort_by] if %w{due_date priority}.include?(params[:sort_by])
  end

  def direction
    params[:direction] if %w{asc desc}.include?(params[:direction])
  end
end
