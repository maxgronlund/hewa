class NewsBlogsController < InheritedResources::Base

  def index
    @menu = 'news_blogs'
    @news_blog = NewsBlog.all
    index!
  end

  def create
    @news_blog = NewsBlog.new(params[:catalog])  
    if @news_blog.save  
      if params[:news_blog][:image]
       redirect_to crop_news_blog_path(@news_blog), :notice => "Nyhed oprettet!"
      else
        redirect_to news_blog_path(@news_blog), :notice => "Nyhed oprettet!"
      end
    else  
      render "new"  
    end
    #create! { news_blogs_path }
  end

  def update
    
    if params[:news_blog][:image] && params[:news_blog][:remove_image] != '1'
      update! { crop_news_blog_path }
    else
      update! 
    end
  end
  
  def crop
    @news_blog = NewsBlog.find(params[:id])
    @crop_version = (params[:version] || :medium).to_sym
    @news_blog.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = NewsImageUploader.version_dimensions[@crop_version]
  end

  def crop_update
    @news_blog = NewsBlog.find(params[:id])
    @news_blog.crop_x = params[:news_blog]["crop_x"]
    @news_blog.crop_y = params[:news_blog]["crop_y"]
    @news_blog.crop_h = params[:news_blog]["crop_h"]
    @news_blog.crop_w = params[:news_blog]["crop_w"]
    @news_blog.crop_version = params[:news_blog]["crop_version"]
    @news_blog.save
    redirect_to edit_news_blog_path(@news_blog)
  end

end
