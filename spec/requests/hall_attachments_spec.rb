require 'rails_helper'

RSpec.describe "HallAttachments", type: :request do
  describe "GET /hall_attachments" do
    it "works! (now write some real specs)" do
      get hall_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
