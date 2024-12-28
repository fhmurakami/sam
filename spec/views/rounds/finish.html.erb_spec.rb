require "rails_helper"

RSpec.describe "rounds/finish", type: :view do
  let(:current_admin) { create(:user_admin) }
  before(:each) do
    assign(:round, Round.new(
      participant: create(:user_participant, first_name: "John", last_name: "Doe", user_admin: current_admin),
      collection: create(:collection, name: "Collection", equations_quantity: 2, user_admin: current_admin)
    ))
  end

  it "renders new round form partial" do
    sign_in current_admin
    stub_template("shared/_header.html.erb" => "This content")

    render

    expect(rendered).to have_selector("h1", text: I18n.t("rounds.congrats"))
    expect(rendered).to have_selector("p", text: I18n.t("rounds.congrats_message"))
  end
end
