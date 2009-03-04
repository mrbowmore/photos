class UsersController < ApplicationController
  
  before_filter :authorize, :only => [:edit, :delete]
  
  def index
    @users = User.find(:all, :order => :name)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def update
     @user = User.find(params[:id])

     respond_to do |format|
       if @user.update_attributes(params[:user])
         flash[:notice] = "User #{@user.name} was successfully updated."
         format.html { redirect_to(:action => :index) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
       end
     end
   end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
