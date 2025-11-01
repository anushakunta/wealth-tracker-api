class ApplicationController < ActionController::API
  before_action :authorize_request

  def encode_token(payload)
    JWT.encode(payload, secret, 'HS256')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return nil unless auth_header
    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, secret, true, { algorithm: 'HS256' })
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return nil unless decoded_token
    user_id = decoded_token[0]['user_id']
    @current_user ||= User.find_by(id: user_id)
  end

  def authorize_request
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end

  private
  def secret
    ENV['JWT_SECRET'] || 'dev_secret'
  end
end
