class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def create
    @task = current_user.tasks.create(params[:task])
  end
end
