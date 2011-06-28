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
      if params[:user][:image]
        redirect_to crop_user_path, :notice => "Signed up!"
      else
        redirect_to root_path, :notice => "Signed up!"
      end
    else  
      render "new"  
    end  
  end  
  
  def update
    if params[:user][:image]
      update! { crop_user_path }
    else
      update!
    end
  end
  
  def crop
    @user = current_user #!!! hey admins can create and edit other users
  end

  def crop_update
    @user = current_user
    @user.crop_x = params[:user]["crop_x"]
    @user.crop_y = params[:user]["crop_y"]
    @user.crop_h = params[:user]["crop_h"]
    @user.crop_w = params[:user]["crop_w"]
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