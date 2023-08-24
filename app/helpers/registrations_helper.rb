module RegistrationsHelper
  def display_verification_status(verified)
    verified ? "Si" : "No"
  end
end
