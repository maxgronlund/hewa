class UsersController < InheritedResources::Base  
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
    @user = current_user
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