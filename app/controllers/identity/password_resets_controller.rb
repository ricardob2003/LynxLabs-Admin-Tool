class Identity::PasswordResetsController < ApplicationController
  skip_before_action :authenticate

  before_action :set_user, only: %i[ edit update ]

  def new
  end

  def edit
  end

  def create
    if @user = User.find_by(email: params[:email], verified: true)
      send_password_reset_email
      redirect_to sign_in_path, notice: "Revise su correo con las instrucciones para restablecer constraseña"
    else
      redirect_to new_identity_password_reset_path, alert: "No puedes restablecer tu contraseña hasta que verifiques tu correo electrónico."
    end
  end

  def update
    if @user.update(user_params)
      revoke_tokens; redirect_to(sign_in_path, notice: "Tu contraseña se restableció exitosamente. Por favor, inicia sesión.")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    token = PasswordResetToken.find_signed!(params[:sid]); @user = token.user
  rescue StandardError
    redirect_to new_identity_password_reset_path, alert: "Ese enlace de restablecimiento de contraseña no es válido."
  end

  def user_params
    params.permit(:password, :password_confirmation)
  end

  def send_password_reset_email
    UserMailer.with(user: @user).password_reset.deliver_later
  end

  def revoke_tokens
    @user.password_reset_tokens.delete_all
  end
end
