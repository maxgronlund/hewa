class UsersController < InheritedResources::Base  
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
    @user = current_user
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