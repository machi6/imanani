class ApplicationController < ActionController::Base
  #before_action :basic_auth ユーザー認証をつけたい場合はここのコメント機能を無効にする
  #before_action :authenticate_user! #本当はここでまとめたいが簡易ログインができなくなるので全てのコントローラーでそれぞれ指定している。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def after_sign_in_path_for (resource)
    user_path(current_user.id)
  end

end
