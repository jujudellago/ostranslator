class BtMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'users/mailer', parts_order: [ "text/plain", "text/html" ]
  layout 'email'


  def confirmation_instructions(record, token, opts={})

    super
  end
  
  def reset_password_instructions(record, token, opts={})

     super
   end


   def imported_instructions(record, token, opts={})
     @token = token
     devise_mail(record, :imported_instructions, opts)
   end
end
