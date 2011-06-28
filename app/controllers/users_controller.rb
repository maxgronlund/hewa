class UsersController < InheritedResources::Base  
  
  def index
    session[:go_to_after_edit] = users_path
    index!
  end
  def new  
    @user = User.new  
  end  
  
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end  
  
  def crop
    @user = current_user #!!! hey admins can create and edit other users
  end

  def crop_update
    @user = current_user
    @user.crop_x = params[:account]["crop_x"]
    @user.crop_y = params[:account]["crop_y"]
    @user.crop_h = params[:account]["crop_h"]
    @user.crop_w = params[:account]["crop_w"]
    @user.save
    redirect_to user_path
  end
  
  def update
    goto = session[:go_to_after_edit] || user_path(@user)
    session[:go_to_after_edit] = nil
    update! {goto}
   end
   
   def show
     session[:go_to_after_edit] = user_path(@user)
     show!
   end

#  def index
#    @users = User.all
#  end
#  
#  def show
#    @users = User.find[params(:user_id)]
#  end
#  
#  def edit
#    @users = User.find[params(:user_id)]
#  end
  
end