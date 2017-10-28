class OwnersController < ApplicationController
  def login

  end

  def authenticate
    owner = Owner.find_by(email: params[:email])
    if owner && owner.password == params[:password]
      flash[:message] = 'Você entrou com sucesso'
      log_in_owner owner
      redirect_to root_path
    else
      flash[:message] = 'Usuario/Senha invalidos'
      redirect_to login_owners_path
    end
  end
end
