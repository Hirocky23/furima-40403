# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :basic_auth

  def index
    respond_to do |format|
      format.html # index.html.erbが表示されます
      format.json { render json: { message: "Welcome to the Application" } }
    end
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
