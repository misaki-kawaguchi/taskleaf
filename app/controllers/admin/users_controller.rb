class Admin::UsersController < ApplicationController

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

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
