class UsersController < InheritedResources::Base  
  
  def index
    return_path users_path
    @is_first_user = User.first.id == 1
    index!
  end

  def show
    return_path user_path
    show!
  end

  def new  
    @is_first_user = User.first.id == 1
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
  
  def edit
    @is_first_user = User.first.id == 1
    edit!
  end
  
  def crop
    @user = current_user #!!! hey admins can create and edit other users

    #version_geometry_width, version_geometry_height = 238, 288
    @version_geometry_width, @version_geometry_height = 50, 50
  end

  def crop_update
    @user = current_user
    @user.crop_x = params[:user]["crop_x"]
    @user.crop_y = params[:user]["crop_y"]
    @user.crop_h = params[:user]["crop_h"]
    @user.crop_w = params[:user]["crop_w"]
    @user.save

    redirect_to return_path(user_path)
  end
  
  def update
    if params[:user][:image]
      update! { crop_user_path }
    else
      update! { return_path(user_path) }
    end
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
  
  private

  def return_path=(path)
    session[:go_to_after_edit] = path
  end

  def return_path(default_path)
    (session[:go_to_after_edit] || default_path).tap do |path|
      session[:go_to_after_edit] = nil
    end
  end

end