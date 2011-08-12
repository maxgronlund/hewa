require "spec_helper"

describe OrderNotification do
  describe "order_placed" do
    let(:mail) { OrderNotification.order_placed }

    it "renders the headers" do
      mail.subject.should eq("Order placed")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "order_placed_confirmation" do
    let(:mail) { OrderNotification.order_placed_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Order placed confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "order_confirmation" do
    let(:mail) { OrderNotification.order_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Order confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
