
def sign_in_and_play

  visit "/"

  fill_in :name1, with: "Kate"
  fill_in :name2, with: "Konrad"
  click_button "Submit"

end

def attack

  sign_in_and_play
  click_button "Attack"


end
