require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe HelpsController do

  # This should return the minimal set of attributes required to create a valid
  # Help. As you add validations to Help, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all helps as @helps" do
      help = Help.create! valid_attributes
      get :index
      assigns(:helps).should eq([help])
    end
  end

  describe "GET show" do
    it "assigns the requested help as @help" do
      help = Help.create! valid_attributes
      get :show, :id => help.id.to_s
      assigns(:help).should eq(help)
    end
  end

  describe "GET new" do
    it "assigns a new help as @help" do
      get :new
      assigns(:help).should be_a_new(Help)
    end
  end

  describe "GET edit" do
    it "assigns the requested help as @help" do
      help = Help.create! valid_attributes
      get :edit, :id => help.id.to_s
      assigns(:help).should eq(help)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Help" do
        expect {
          post :create, :help => valid_attributes
        }.to change(Help, :count).by(1)
      end

      it "assigns a newly created help as @help" do
        post :create, :help => valid_attributes
        assigns(:help).should be_a(Help)
        assigns(:help).should be_persisted
      end

      it "redirects to the created help" do
        post :create, :help => valid_attributes
        response.should redirect_to(Help.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved help as @help" do
        # Trigger the behavior that occurs when invalid params are submitted
        Help.any_instance.stub(:save).and_return(false)
        post :create, :help => {}
        assigns(:help).should be_a_new(Help)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Help.any_instance.stub(:save).and_return(false)
        post :create, :help => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested help" do
        help = Help.create! valid_attributes
        # Assuming there are no other helps in the database, this
        # specifies that the Help created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Help.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => help.id, :help => {'these' => 'params'}
      end

      it "assigns the requested help as @help" do
        help = Help.create! valid_attributes
        put :update, :id => help.id, :help => valid_attributes
        assigns(:help).should eq(help)
      end

      it "redirects to the help" do
        help = Help.create! valid_attributes
        put :update, :id => help.id, :help => valid_attributes
        response.should redirect_to(help)
      end
    end

    describe "with invalid params" do
      it "assigns the help as @help" do
        help = Help.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Help.any_instance.stub(:save).and_return(false)
        put :update, :id => help.id.to_s, :help => {}
        assigns(:help).should eq(help)
      end

      it "re-renders the 'edit' template" do
        help = Help.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Help.any_instance.stub(:save).and_return(false)
        put :update, :id => help.id.to_s, :help => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested help" do
      help = Help.create! valid_attributes
      expect {
        delete :destroy, :id => help.id.to_s
      }.to change(Help, :count).by(-1)
    end

    it "redirects to the helps list" do
      help = Help.create! valid_attributes
      delete :destroy, :id => help.id.to_s
      response.should redirect_to(helps_url)
    end
  end

end
