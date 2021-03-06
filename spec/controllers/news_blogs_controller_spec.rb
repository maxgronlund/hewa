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

describe NewsBlogsController do

  # This should return the minimal set of attributes required to create a valid
  # NewsBlog. As you add validations to NewsBlog, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all news_blogs as @news_blogs" do
      news_blog = NewsBlog.create! valid_attributes
      get :index
      assigns(:news_blogs).should eq([news_blog])
    end
  end

  describe "GET show" do
    it "assigns the requested news_blog as @news_blog" do
      news_blog = NewsBlog.create! valid_attributes
      get :show, :id => news_blog.id.to_s
      assigns(:news_blog).should eq(news_blog)
    end
  end

  describe "GET new" do
    it "assigns a new news_blog as @news_blog" do
      get :new
      assigns(:news_blog).should be_a_new(NewsBlog)
    end
  end

  describe "GET edit" do
    it "assigns the requested news_blog as @news_blog" do
      news_blog = NewsBlog.create! valid_attributes
      get :edit, :id => news_blog.id.to_s
      assigns(:news_blog).should eq(news_blog)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new NewsBlog" do
        expect {
          post :create, :news_blog => valid_attributes
        }.to change(NewsBlog, :count).by(1)
      end

      it "assigns a newly created news_blog as @news_blog" do
        post :create, :news_blog => valid_attributes
        assigns(:news_blog).should be_a(NewsBlog)
        assigns(:news_blog).should be_persisted
      end

      it "redirects to the created news_blog" do
        post :create, :news_blog => valid_attributes
        response.should redirect_to(NewsBlog.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved news_blog as @news_blog" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewsBlog.any_instance.stub(:save).and_return(false)
        post :create, :news_blog => {}
        assigns(:news_blog).should be_a_new(NewsBlog)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewsBlog.any_instance.stub(:save).and_return(false)
        post :create, :news_blog => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested news_blog" do
        news_blog = NewsBlog.create! valid_attributes
        # Assuming there are no other news_blogs in the database, this
        # specifies that the NewsBlog created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        NewsBlog.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => news_blog.id, :news_blog => {'these' => 'params'}
      end

      it "assigns the requested news_blog as @news_blog" do
        news_blog = NewsBlog.create! valid_attributes
        put :update, :id => news_blog.id, :news_blog => valid_attributes
        assigns(:news_blog).should eq(news_blog)
      end

      it "redirects to the news_blog" do
        news_blog = NewsBlog.create! valid_attributes
        put :update, :id => news_blog.id, :news_blog => valid_attributes
        response.should redirect_to(news_blog)
      end
    end

    describe "with invalid params" do
      it "assigns the news_blog as @news_blog" do
        news_blog = NewsBlog.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewsBlog.any_instance.stub(:save).and_return(false)
        put :update, :id => news_blog.id.to_s, :news_blog => {}
        assigns(:news_blog).should eq(news_blog)
      end

      it "re-renders the 'edit' template" do
        news_blog = NewsBlog.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewsBlog.any_instance.stub(:save).and_return(false)
        put :update, :id => news_blog.id.to_s, :news_blog => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested news_blog" do
      news_blog = NewsBlog.create! valid_attributes
      expect {
        delete :destroy, :id => news_blog.id.to_s
      }.to change(NewsBlog, :count).by(-1)
    end

    it "redirects to the news_blogs list" do
      news_blog = NewsBlog.create! valid_attributes
      delete :destroy, :id => news_blog.id.to_s
      response.should redirect_to(news_blogs_url)
    end
  end

end
