# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  include CASControllerIncludes

  # Don't render new.rhtml; instead, just redirect to dashboard, because  
  # we want to prevent people from accessing restful_authentication's 
  # user subsystem directly, instead using CAS.
  def new
    redirect_to :controller => "dashboard", :action => "index"
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:email], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default(:controller=>"dashboard", :action=>:index)
      flash[:notice] = "Logged in successfully"
    else
      note_failed_signin
      @email       = params[:email]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    
     # http://wiki.case.edu/Central_Authentication_Service: best practices: only logout app, not CAS

    flash[:notice] = "You have been logged out of ResearchMatch. You're still logged in to CAS, though.. click <a href='#{url_for :action=>:logout_cas}'><b>here</b></a> to logout of CAS."
#    redirect_back_or_default(:controller=>"dashboard", :action=>:index) 
    redirect_to :controller=>:dashboard, :action=>:index
  end

  def logout_cas
    CASClient::Frameworks::Rails::Filter.logout(self, url_for(:controller=>:dashboard, :action=>:index) )
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:email]}'. Check your email or password."
    logger.warn "Failed login for '#{params[:email]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
