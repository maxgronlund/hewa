class VideoCastsController < InheritedResources::Base
  helper_method :sort_column, :sort_direction

  def index
    @menu = 'admin'
    session[:go_to_after_edit] = video_casts_path
    @video_casts = VideoCast.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)
  end

private  
  def sort_column  
    TextContent.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end 

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
end
