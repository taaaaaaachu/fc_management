class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.class == Admin
      root_path
    else
      my_page_path(resource)
    end
  end
end