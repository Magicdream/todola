class Api::TokensController < Api::BaseController
  def create
    if params[:email].blank? || params[:password].nil?
      error_response('BLANK')
    else
      if user = User.find_by_email(params[:email].downcase)
        # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
        user.ensure_authentication_token!

        if user.valid_password?(params[:password])
          ok_response(:auth_token => user.authentication_token)
        else
          error_response('INCORRECT')
        end
      else
        error_response('INCORRECT')
      end
    end
  end

  def destroy
    if user = User.find_by_authentication_token(params[:id])
      user.reset_authentication_token!
      ok_response(token: params[:id])
    else
      error_response('INVALID')
    end
  end
end