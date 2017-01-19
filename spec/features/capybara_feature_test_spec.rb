#require 'app'
require 'spec_helper'

RSpec.feature "Capybara feature test" do
  scenario "players can enter their names and see them on screen" do

    sign_in_and_play

    expect(page).to have_content "Kate vs Konrad"
  end
  scenario "so players can see their Hit Points" do

    sign_in_and_play

    expect(page).to have_content "Kate HP: 20 Konrad HP: 20"
  end
  scenario "players can launch an attack" do
    attack
    expect(page).to have_content "Kate performed an attack!"
  end

  scenario "attacks cause 10HP damage" do
    attack
    expect(page).to have_content "Konrad HP: 10"
  end

  scenario "players know who's turn it is" do
    sign_in_and_play
    expect(page).to have_content "Kate's turn"
  end

  scenario "so turns switch" do
    attack
    expect(page).to have_content "Konrad's turn"
  end

  scenario "attacks cause 10HP damage" do
    attack
    expect(page).to have_content "Konrad HP: 10"
    click_button "Attack"
      expect(page).to have_content "Kate HP: 10"
  end

  scenario "when my HP reaches 0, I see a lose message" do
    attack
    2.times {click_button "Attack"}
    expect(page).to have_content "GAME OVER: Kate Wins!"
  end

end
