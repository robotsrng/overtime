require 'rails_helper'

describe 'posts navigation and creation' do

  describe 'navigation' do
    before do
      @user = User.create!(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow", username: "watcheronthewall")
      login_as(@user, scope: :user)
    end
    describe 'index' do
      it 'can be reached successfully' do
        visit posts_path
        expect(page.status_code).to eq(200)
      end

      it 'has a list of posts' do
        post1 = Post.create(date: Date.today, rationale: "post1", user: @user)
        post2 = Post.create(date: Date.today, rationale: "post2", user: @user)
        visit posts_path
        expect(page).to have_content(/post1|post2/)
      end
    end


  end

  describe 'creation' do

    before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow", username: "watcheronthewall")
      login_as(@user, scope: :user)
      visit new_post_path
    end

    it 'can register with full set of user attributes' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Worked Late"
      click_on "Create Post"
      expect(page).to have_content("successfully")
    end

    it 'has a new form that can be reached succesfully' do
      expect(page.status_code).to equal(200)
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Association"
      click_on "Create Post"
      expect(User.last.posts.last.rationale).to eq("Association")
    end
  end
end