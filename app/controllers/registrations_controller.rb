class RegistrationsController < ApplicationController
  skip_before_action :authenticate, only: [:create, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session_record = @user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: session_record.id, httponly: true }

      send_email_verification
      flash[:notice] = "Bienvenido! Ha asignado un administrador exitosamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user
      @user.destroy
      redirect_to employees_url, notice: "El Perfil del Administrador se ha eliminado exitosamente"
    else
      redirect_to employees_url, alert: "El Perfil del Administrador no se encontró"
    end
  end

  private

  def user_params
    # Permit the username parameter and strip leading/trailing spaces
    params.permit(:email, :password, :password_confirmation, :username).tap do |whitelisted|
      whitelisted[:username] = params[:username].strip if params[:username].present?
    end
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
