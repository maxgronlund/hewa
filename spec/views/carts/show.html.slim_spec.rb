require 'spec_helper'

describe "carts/show.html.slim" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart))
  end

  it "renders attributes in <p>" do
    render
  end
end
