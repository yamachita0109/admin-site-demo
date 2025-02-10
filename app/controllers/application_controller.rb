class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  layout :set_layout

  private

  def set_layout
    if devise_controller?
      if resource_class == Admin
        "admin"
      elsif resource_class == User
        "user"
      else
        "application"
      end
    else
      "application"
    end
  end
end
