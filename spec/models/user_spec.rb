require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_parties)}
    it { should have_many(:parties).through(:user_parties)}
  end

  describe 'test of validations' do
    it 'encrypts password' do
      test_user = User.create(name: 'Sierra', email: 'sierra@test.com', password: 'test12', password_confirmation: 'test12')
      expect(test_user).to_not have_attribute(:password)
      expect(test_user).to_not have_attribute(:password_confirmation)
      expect(test_user.password_digest).to_not eq('test12')
    end
  end
end
