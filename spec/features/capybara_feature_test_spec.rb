#require 'app'
require 'spec_helper'

RSpec.feature "Capybara feature test" do
  scenario "players can enter their names and see them on screen" do

    sign_in_and_play

    expect(page).to have_content "First player: Kate; second player: Konrad"
  end
  scenario "so players can see their Hit Points" do

    sign_in_and_play

    expect(page).to have_content "Kate HP: 20, Konrad HP: 20"
  end
  scenario "players can launch an attack" do

    attack
    expect(page). to have_content "Kate attacked Konrad"

  end

  scenario "attacks cause 10HP damage" do
    attack
    expect(page). to have_content "Konrad HP: 10"
  end

end
