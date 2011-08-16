class AddressesController < InheritedResources::Base
    belongs_to :user , :optional => true
    
    def new
      @address = Address.new :user_country => 'Danmark'
      new!
    end
    
    def create
      create! { params[:rurl].present?? params[:rurl] : @address.user}
    end
    
    def update
      update! { params[:rurl].present?? params[:rurl] : @address.user}
    end
    
    def destroy
      @user = @address.user
      destroy! { @user }
    end
end
