class TasksController < ApplicationController

  # 一覧表示
  def index
    @tasks = Task.all
  end

  # 詳細表示
  def show
    @task = Task.find(params[:id])
  end

  # 新規登録画面
  def new
    @task = Task.new
  end

  # 登録アクション
  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
