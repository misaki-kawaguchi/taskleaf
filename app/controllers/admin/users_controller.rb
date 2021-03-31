class Admin::UsersController < ApplicationController
  before_action :require_admin

  # ユーザー一覧
  def index
    @users = User.all
  end

  # ユーザー登録フォーム
  def new
    @user = User.new
  end

  # 登録アクション
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  # ユーザー詳細
  def show
    @user = User.find(params[:id])
  end

  # ユーザー編集
  def edit
    @user = User.find(params[:id])
  end

  # ユーザー情報更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :edit
    end
  end

  # 削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
