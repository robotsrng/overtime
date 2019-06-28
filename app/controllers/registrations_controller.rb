class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :phone, :address1, :address2, :city, :post_code, :state, :country, :role)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :username, :phone, :address1, :address2, :city, :post_code, :state, :country, :role, :type)
  end
end