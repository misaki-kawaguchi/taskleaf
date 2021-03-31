class SessionsController < ApplicationController

  skip_before_action :login_required

  def new
  end

  def create
    # 送られてきたメールアドレスでユーザー検索する
    user = User.find_by(email: session_params[:email])

    # 引数で受け取ったパスワードをハッシュ化して、その結果がUserオブジェクト内部に保存されているdigestと一致するか調べる
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
