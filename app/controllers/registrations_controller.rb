class RegistrationsController < Devise::RegistrationsController

  protected

  # See https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-up-(registration)

  def after_sign_up_path_for(resource)
    new_post_path
  end



end
