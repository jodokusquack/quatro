require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with invalid username' do
    let!(:invalid_user) { build(:user, username: 'invalid@false.com') }

    it 'is invalid with an @ symbol' do
      expect(invalid_user).to_not be_valid
      expect(invalid_user.errors.messages[:username]).to eq ['is invalid']
    end
  end
end
