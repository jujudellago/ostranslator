# :nodoc:
class ApplicationController < ActionController::Base
  # Authorization gem
  include Pundit

  protect_from_forgery with: :exception
  before_action :set_locale

  # Ensure that Pundit's #verify_policy_scoped or #verify_authorized are
  # called in all actions of all controllers. In other words, ensure
  # authorization policies are enforced everywhere.
  after_action :verify_authorized,
               except: :index,
               unless: :devise_controller?
  after_action :verify_policy_scoped,
               only: :index,
               unless: :devise_controller?

  # Require authentication for all requests. Add
  # skip_before_action :authenticate_user! to controllers that should not
  # require authentication.
  before_action :authenticate_user!, unless: :devise_controller?

  # Display user-friendly errors for the following exceptions
  rescue_from Pundit::NotAuthorizedError,
              with: :show_user_not_authorized_error
  rescue_from ActiveRecord::DeleteRestrictionError,
              with: :show_delete_restriction_error

#  helper Lit::FrontendHelper

  layout :set_layout

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  private


  def set_locale
    if language_change_necessary?
      I18n.locale = the_new_locale
      set_locale_cookie(I18n.locale.to_s)
    else
      use_locale_from_cookie
    end
    @display_title=true
  end
  def language_change_necessary?
    return cookies['osdb_translation_locale'].nil? || params[:locale]
  end
  def the_new_locale
    new_locale = (params[:locale] || extract_locale_from_accept_language_header)
    I18n.available_locales.include?(new_locale.to_sym) ? new_locale : I18n.default_locale
  end

  def set_locale_cookie(locale)
    cookies['osdb_translation_locale'] = {
      value: locale,
      expires: 1.year.from_now
    }

  end
  # Reads the locale cookie and sets the locale from it
  def use_locale_from_cookie
    I18n.locale = cookies['osdb_translation_locale']
  end
  def extract_locale_from_accept_language_header
    if request.env['HTTP_ACCEPT_LANGUAGE']
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    else
      I18n.default_locale
    end
  end
  
  # Choose from 3 types of layouts: guest (not logged-in), user or admin
  def set_layout
    return 'guest' unless user_signed_in?
    current_user.admin? ? 'admin' : 'user'
  end

  # Rescue Pundit::NotAuthorizedError, which happens when a user tries to
  # access a resource for which he does not have permission.
  def show_user_not_authorized_error
    redirect_to request.referer || root_path,
                flash: { error: t(:not_authorized, scope: 'authorization') }
  end

  # Rescue raise ActiveRecord::DeleteRestrictionError, which happens when trying
  # do delete records restricted by "dependent: :restrict_with_exception"
  def show_delete_restriction_error(exception)
    redirect_to request.referer || root_path,
                flash: { error: exception.message }
  end
end
