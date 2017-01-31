require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'creation' do
    before do
      @adminUser = AdminUser.create(email: 'admintest@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Jon', last_name: 'Snow')
    end
    it 'can be created' do
      expect(@adminUser).to be_valid
    end
  end
end
