class ApplicationController < ActionController::Base

  # ユーザーを取得
  helper_method :current_user

  before_action :login_required

  private

  # 最初（nilの場合）は「User.find_by(id: session[:user_id])」を@current_userに代入
  # それ以降は@current_userを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_url unless current_user
  end
end
