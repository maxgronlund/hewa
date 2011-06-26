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
  
#  def index
#    @users = User.all
#  end
#  
#  def show
#    @users = User.find[params(:user_id)]
#  end
#  
#  def edit
#    @users = User.find[params(:id)]
#  end
  
end