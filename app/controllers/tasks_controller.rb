class TasksController < ApplicationController
  def index
  end

  def show
  end

  # 新規登録画面
  def new
    @task = Task.new
  end

  def edit
  end
end
