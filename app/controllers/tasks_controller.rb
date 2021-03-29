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
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  # 編集画面
  def edit
    @task = Task.find(params[:id])
  end

  # データベースを更新
  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  # 削除
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
