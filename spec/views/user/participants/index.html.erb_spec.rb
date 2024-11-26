require 'rails_helper'

RSpec.describe "user/participants/index", type: :view do
  before(:each) do
    assign(:user_participants, [
      User::Participant.create!(
        first_name: "First Name",
        last_name: "Last Name",
        user_admin: nil
      ),
      User::Participant.create!(
        first_name: "First Name",
        last_name: "Last Name",
        user_admin: nil
      )
    ])
  end

  it "renders a list of user/participants" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end