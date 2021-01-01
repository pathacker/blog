# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :admin?

  protected

  def authorize
    return if admin?

    flash[:alert] = ' unauthorized access'
    redirect_to :root
  end

  def admin?
    session[:logged_in]
  end
end
