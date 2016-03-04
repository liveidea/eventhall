require 'rails_helper'

RSpec.describe "hall_attachments/index", type: :view do
  before(:each) do
    assign(:hall_attachments, [
      HallAttachment.create!(
        :hall_id => 1,
        :photo => "Photo"
      ),
      HallAttachment.create!(
        :hall_id => 1,
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of hall_attachments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
