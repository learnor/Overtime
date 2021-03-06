require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/rationale|content/)
    end
  end

  describe 'new' do
    it 'has a link from homepage' do
      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'detele' do
    it 'can be deleted' do
      @post = FactoryGirl.create(:post)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    before do
      @edit_user = User.create(email:'edit_user@test.com', password:'asdfasdf', password_confirmation:'asdfasdf', first_name:'User', last_name:'Editor')
      login_as(@edit_user, scope: :user)
      @edit_post = Post.create(date: Date.today, rationale: 'Some ration', user_id: @edit_user.id)
    end

    it 'can be edited' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('Edited Content')
    end
     it 'cannot be edited by a non authorized user' do
       logout(:user)
       non_authorized_user = FactoryGirl.create(:non_authorized_user)
       login_as(non_authorized_user, scope: :user)

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(root_path)
     end
  end
end
