class Identity::EmailVerificationsController < ApplicationController
  skip_before_action :authenticate, only: :show

  before_action :set_user, only: :show

  def show
    @user.update! verified: true
    redirect_to root_path, notice: "Gracias por verificar tu dirección de correo electrónico."
  end

  def create
    send_email_verification
    redirect_to root_path, notice: "Hemos enviado un correo electrónico de verificación a tu dirección de correo electrónico."
  end

  private

  def set_user
    token = EmailVerificationToken.find_signed!(params[:sid]); @user = token.user
  rescue StandardError
    redirect_to edit_identity_email_path, alert: "Ese enlace de verificación de correo electrónico no es válido."
  end

  def send_email_verification
    UserMailer.with(user: Current.user).email_verification.deliver_later
  end
end
