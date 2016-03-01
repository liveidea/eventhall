require 'rails_helper'

RSpec.describe "hall_attachments/new", type: :view do
  before(:each) do
    assign(:hall_attachment, HallAttachment.new(
      :hall_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders new hall_attachment form" do
    render

    assert_select "form[action=?][method=?]", hall_attachments_path, "post" do

      assert_select "input#hall_attachment_hall_id[name=?]", "hall_attachment[hall_id]"

      assert_select "input#hall_attachment_photo[name=?]", "hall_attachment[photo]"
    end
  end
end
