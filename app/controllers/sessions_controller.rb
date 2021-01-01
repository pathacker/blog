# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    redirect_to(:root, alert: 'Login attempt failed') and return if ENV['BLOG_PASSWORD'] != params[:password]

    session[:logged_in] = true
    flash[:notice] = 'Successfully logged in'
    redirect_to :root
  end

  def destroy
    reset_session
    flash[:notice] = 'Successfully logged out'
    redirect_to login_path
  end
end
