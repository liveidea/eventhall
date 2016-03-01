require 'rails_helper'

RSpec.describe "hall_attachments/show", type: :view do
  before(:each) do
    @hall_attachment = assign(:hall_attachment, HallAttachment.create!(
      :hall_id => 1,
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Photo/)
  end
end
