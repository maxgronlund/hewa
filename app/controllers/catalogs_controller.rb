class CatalogsController < InheritedResources::Base
  helper_method :sort_column, :sort_direction
  before_filter :set_menu
  
  def show
    session[:go_to_after_edit] = catalog_path(@catalog)
    @catalogs = Catalog.all
    show!
  end
  
  def index
    session[:go_to_after_edit] = catalogs_path
    @catalogs = Catalog.order(sort_column + " " + sort_direction).page(params[:page]).per(25)
  end
  
  def create
    @catalog = Catalog.new(params[:catalog])  
    if @catalog.save  
      if params[:catalog][:image]
       redirect_to crop_catalog_path(@catalog), :notice => "Katalog oprettet!"
      else
        redirect_to catalog_path(@catalog), :notice => "Katalog oprettet!"
      end
    else  
      render "new"  
    end  
  end  

  def crop
    @catalog = Catalog.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @catalog.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = CatalogImageUploader.version_dimensions[@crop_version]
  end

  def crop_update
    @catalog = Catalog.find(params[:id])
    @catalog.crop_x = params[:catalog]["crop_x"]
    @catalog.crop_y = params[:catalog]["crop_y"]
    @catalog.crop_h = params[:catalog]["crop_h"]
    @catalog.crop_w = params[:catalog]["crop_w"]
    @catalog.crop_version = params[:catalog]["crop_version"]
    @catalog.save
    redirect_to edit_catalog_path(@catalog)
  end
  
  def update
    if params[:catalog][:image] && params[:catalog][:remove_image] != '1'
      update! { crop_catalog_path }
    else
      update! { catalog_path(@catalog) }
    end
  end

   
   
  
private  
    def sort_column  
      Catalog.column_names.include?(params[:sort]) ? params[:sort] : "title"  
    end 

    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end

    def set_menu
      @menu = 'catalog'
    end
end
