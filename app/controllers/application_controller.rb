class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_api_key

  def check_api_key
    @api_key = ApiKey.where(key: params[:api_key]).first
    unless @api_key
      @message = "Invalid Request"
      return render "errors/404", status: 401
    end
  end
end
