require 'rails_helper'

describe 'posts navigation and creation' do

   describe 'creation' do
    it 'can register with full set of user attributes' do
      visit "/posts/new"

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Worked Late"

      click_on "Create Post"

      expect(page).to have_content("successfully")
    end
  end
  it 'has a new form that can be reached succesfully' do
    visit new_post_path
    expect(page.status_code).to equal(200)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
  end
end