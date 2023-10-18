class UserMailer < ApplicationMailer
  default_url_options[:host] = "rocky-refuge-27192-72dea8cf604b.herokuapp.com"

  def password_reset
    @user = params[:user]
    @signed_id = @user.password_reset_tokens.create.signed_id(expires_in: 20.minutes)

    mail(
      to: @user.email,
      subject: "Restablece tu contraseña",
    )
  end

  def email_verification
    @user = params[:user]
    @signed_id = @user.email_verification_tokens.create.signed_id(expires_in: 2.days)

    mail(
      to: @user.email,
      subject: "Verifica tu correo electrónico",
    )
  end
end
