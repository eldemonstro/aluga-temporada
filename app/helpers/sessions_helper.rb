module SessionsHelper
  def log_in_owner(owner)
    session[:owner] = owner.id
  end
end
