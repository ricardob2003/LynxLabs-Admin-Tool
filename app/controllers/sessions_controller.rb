class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[ new create ]

  before_action :set_session, only: :destroy

  def index
    @sessions = Current.user.sessions.order(created_at: :desc)
  end

  def show
    @sessions = Current.user.sessions
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      @session = user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: @session.id, httponly: true }

      redirect_to home_page_path, notice: "Ha Iniciado Sesión Exitosamente"
    else
      redirect_to sign_in_path(email_hint: params[:email]), alert: "Credenciales Incorrectas"
    end
  end

  def destroy
    @session.destroy; redirect_to(sessions_path, notice: "Esta sesión se ha terminado")
  end

  private

  def set_session
    @session = Current.user.sessions.find(params[:id])
  end
end
