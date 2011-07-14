class HelpsController < InheritedResources::Base
  load_and_authorize_resource

  helper_method :sort_column, :sort_direction
#  before_filter :get_site_info
  
  def show
    session[:go_to_after_edit] = help_path(@help)
    show!
  end
  
  def index
    @menu = 'admin'
    session[:go_to_after_edit] = helps_path
    @helps = Help.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)
  end
  
  def create
    goto = session[:go_to_after_edit] || helps_path
    session[:go_to_after_edit] = nil
    create! {goto}
  end
  
  def update
    goto = session[:go_to_after_edit] || helps_path
    session[:go_to_after_edit] = nil
    update! {goto}
  end
  
private  
  def sort_column  
    Help.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end 

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
end