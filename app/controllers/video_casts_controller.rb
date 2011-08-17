class VideoCastsController < InheritedResources::Base
  helper_method :sort_column, :sort_direction

  def index
    @menu = 'admin'
    session[:go_to_after_edit] = video_casts_path
    @video_casts = VideoCast.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)
    
    
  end
  
  def show
    
    if browser.firefox?
      @video = VideoCast.find(params[:id]).ogv
    elsif browser.safari?
      @video = VideoCast.find(params[:id]).m4v
    elsif browser.chrome?
      @video = VideoCast.find(params[:id]).mp4
    elsif browser.opera?
      @video = VideoCast.find(params[:id]).m4v
    else
      @video = VideoCast.find(params[:id]).mp4
    end
        
    show!
  end

private  
  def sort_column  
    TextContent.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end 

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
end
