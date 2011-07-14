class ProductsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :product_line , :optional => true
#  before_filter :get_site_info
  

  helper_method :sort_column, :sort_direction
  
  def new
    @product_lines = ProductLine.order('title DESC')
    @select_product_lines = @product_lines.map { |product_line| [product_line.title, product_line.id] }
    new!
  end
  
  def edit
    @product_lines = ProductLine.order('title DESC')
    @select_product_lines = @product_lines.map { |product_line| [product_line.title, product_line.id] }
    edit!
  end
  
  def show
    session[:go_to_after_edit] = product_line_product_path(@product.product_line,@product)
    show!
  end
  
  def index
#    session[:go_to_after_edit] = product_line_products_path(@product.product_line)
    @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(25)
  end
  
  def create
    goto = session[:go_to_after_edit] || products_path
    session[:go_to_after_edit] = nil
    create! {goto}
  end
  
  def update
    goto = session[:go_to_after_edit] || products_path
    session[:go_to_after_edit] = nil
    
    if params[:product][:image] && params[:product][:remove_image] != '1'
      update! { goto }
    else
      update! { product_line_product_path(@product.product_line,@product) }
    end
    
  
  end
  
  
  def crop
    @crop_version = (params[:version] || :small).to_sym
    @product.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = ProductImageUploader.version_dimensions[@crop_version]
  end
  
  def crop_update
    @product = Product.find(params[:id])
    @product.crop_x = params[:product]["crop_x"]
    @product.crop_y = params[:product]["crop_y"]
    @product.crop_h = params[:product]["crop_h"]
    @product.crop_w = params[:product]["crop_w"]
    @product.crop_version = params[:product]["crop_version"]
    @product.save
  
    redirect_to product_line_product_path(@product.product_line,@product)
  end
  
      

private  
    def sort_column  
      Product.column_names.include?(params[:sort]) ? params[:sort] : "title"  
    end 

    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end
  
  
end
