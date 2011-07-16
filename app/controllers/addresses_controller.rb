class AddressesController < InheritedResources::Base
    belongs_to :user , :optional => true
    
    def create
      create! { @address.user}
    end
    
    def update
      update! { @address.user}
    end
    
    def destroy
      go_to = session[:go_to_after_edit]
      session[:go_to_after_edit] = nil
      destroy! { go_to}
    end
end
