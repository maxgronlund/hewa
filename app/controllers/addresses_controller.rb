class AddressesController < InheritedResources::Base
    belongs_to :user , :optional => true
    
    def new
      @address = Address.new :user_country => 'Denmark'
      new!
    end
    
    def create
      create! { params[:rurl] || @address.user}
    end
    
    def update
      update! { params[:rurl] || @address.user}
    end
    
    def destroy
      go_to = session[:go_to_after_edit]
      session[:go_to_after_edit] = nil
      destroy! { go_to}
    end
end
