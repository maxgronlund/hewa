class TextContentsController < InheritedResources::Base
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  before_filter :get_site_info
  
  def show
    session[:go_to_after_edit] = text_content_path(@text_content)
    show!
  end
  
  def index
    session[:go_to_after_edit] = text_contents_path
    @text_contents = TextContent.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)
  end
  
  def create
    goto = session[:go_to_after_edit] || text_contents_path
    session[:go_to_after_edit] = nil
    create! {goto}
  end
  
  def update
    goto = session[:go_to_after_edit] || text_contents_path
    session[:go_to_after_edit] = nil
    update! {goto}
  end
  
private  
  def sort_column  
    TextContent.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end 

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
end
