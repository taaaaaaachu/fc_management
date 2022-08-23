class ApplicationController < ActionController::Base
  protected

  def devise_parameter_sanitizer
    if resource_class == User
      UsersParameterSanitizer.new(Users, :user, params)
    elsif resource_class == Admins
      Admins::ParameterSanitizer.new(Admin, :admin, params)
    else
      super
    end
  end
end
