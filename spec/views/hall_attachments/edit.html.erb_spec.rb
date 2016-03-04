require 'rails_helper'

RSpec.describe "hall_attachments/edit", type: :view do
  before(:each) do
    @hall_attachment = assign(:hall_attachment, HallAttachment.create!(
      :hall_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders the edit hall_attachment form" do
    render

    assert_select "form[action=?][method=?]", hall_attachment_path(@hall_attachment), "post" do

      assert_select "input#hall_attachment_hall_id[name=?]", "hall_attachment[hall_id]"

      assert_select "input#hall_attachment_photo[name=?]", "hall_attachment[photo]"
    end
  end
end
