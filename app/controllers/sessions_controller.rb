class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.aunthentificate(session_params[:passeord])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました'
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
