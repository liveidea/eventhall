require "rails_helper"

describe User do

  it "should do something" do
  	(1+1).should==3
 end
  it "create account after user saving" do
   user = create(:user)
   expect(user.account_id).not_to be_nil  
 end
