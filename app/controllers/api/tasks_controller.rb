class Api::TasksController < Api::BaseController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :destroy, :update, :complete, :uncomplete]

  def show
    ok_response(task: @task)
  end

  def create
    @task = current_user.tasks.create(task_params)

    if @task.persisted?
      ok_response(task: @task)
    else
      error_response('INVALID', errors: @task.errors_a )
    end
  end

  def index
    @tasks = current_user.tasks.search(params[:sort_by], params[:direction])
    ok_response(tasks: @tasks)
  end

  def destroy
    @task.destroy
    ok_response
  end

  def update
    if @task.update_attributes(task_params)
      ok_response(task: @task)
    else
      error_response('INVALID', errors: @task.errors_a)
    end
  end

  def complete
    if @task.complete
      ok_response(task: @task)
    else
      error_response('INVALID_TRANSITION')
    end
  end

  def uncomplete
    if @task.uncomplete
      ok_response(task: @task)
    else
      error_response('INVALID_TRANSITION')
    end
  end

  protected

  def task_params
    params.slice(:name, :priority, :due_date, :due_date_fmt)
  end

  def find_task
    @task = current_user.tasks.find(params[:id])
  end
end