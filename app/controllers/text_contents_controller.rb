class TextContentsController < InheritedResources::Base
  def show
    show!
  end
  
  def index
    index!
  end
end
