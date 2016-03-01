require "rails_helper"

RSpec.describe HallAttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hall_attachments").to route_to("hall_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/hall_attachments/new").to route_to("hall_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/hall_attachments/1").to route_to("hall_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hall_attachments/1/edit").to route_to("hall_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hall_attachments").to route_to("hall_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hall_attachments/1").to route_to("hall_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hall_attachments/1").to route_to("hall_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hall_attachments/1").to route_to("hall_attachments#destroy", :id => "1")
    end

  end
end
