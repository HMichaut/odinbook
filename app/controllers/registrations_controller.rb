class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted? && !@user.email.empty?
      UserMailer.with(user: @user).welcome_email.deliver_later
    end
  end

  private
  def sign_up_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation)
  end

  def sign_in_params
    params.require(:user).permit( :email, :password)
  end

  def account_update_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation, :current_password)
  end
end