class Users::PasswordsController < Devise::PasswordsController
 
  def imported
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
  end
 
end
