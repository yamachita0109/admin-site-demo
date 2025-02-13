class ApplicationController < ActionController::Base
  layout :set_layout

  private

  def set_layout
    if admin_signed_in?
      "admin"
    elsif writer_signed_in?
      "writer"
    else
      "application"
    end
  end
end