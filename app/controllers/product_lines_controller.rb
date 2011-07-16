class ProductLinesController < InheritedResources::Base
    load_and_authorize_resource
    helper_method :sort_column, :sort_direction
    before_filter :set_menu
    
    
    def show
     # @product_lines = ProductLine.order('title asc')
      session[:go_to_after_edit] = product_line_path(@product_line)
      show!
    end

    def index
      session[:go_to_after_edit] = product_lines_path
      @product_lines = ProductLine.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)
    end

    def create
      goto = session[:go_to_after_edit] || product_lines_path
      session[:go_to_after_edit] = nil
      create! {goto}
    end

    def update
      if params[:product_line][:image] && params[:product_line][:remove_image] != '1'
        update! { crop_product_line_path }
      else
        update! { product_line_path(@product_line) }
      end
      
#      goto = session[:go_to_after_edit] || product_lines_path
#      session[:go_to_after_edit] = nil
#      update! {goto}
    end
    
    
    def crop
      @crop_version = (params[:version] || :small).to_sym
      @product_line.get_crop_version! @crop_version
      @version_geometry_width, @version_geometry_height = ProductLineImageUploader.version_dimensions[@crop_version]
    end

    def crop_update
      @product_line = ProductLine.find(params[:id])
      @product_line.crop_x = params[:product_line]["crop_x"]
      @product_line.crop_y = params[:product_line]["crop_y"]
      @product_line.crop_h = params[:product_line]["crop_h"]
      @product_line.crop_w = params[:product_line]["crop_w"]
      @product_line.crop_version = params[:product_line]["crop_version"]
      @product_line.save

      redirect_to product_line_path(@product_line)
    end
    
    

private  
    def sort_column  
      ProductLine.column_names.include?(params[:sort]) ? params[:sort] : "title"  
    end 

    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end
    
    def set_menu
      @menu = 'product_lines'
    end
end
