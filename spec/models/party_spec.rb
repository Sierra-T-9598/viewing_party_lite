require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date)}
    it { should validate_presence_of(:time)}
    it { should validate_presence_of(:duration)}
    # it { should validate_presence_of(:movie_id)}
    # it { should validate_presence_of(:host_id)}
    # it { should validate_presence_of(:invitee_id)}
  end

  describe 'relationships' do
    it { should have_many(:user_parties)}
    it { should have_many(:users).through(:user_parties)}
  end

  describe 'instance methods' do
    let(:user_1) { create :user }
    let(:user_2) { create :user }
    let(:user_3) { create :user }

    let(:party) { Party.create!(duration: 139, date: Date.new , time: Time.now, movie_id: 550, host_id: user_1.id, invitee_id: nil)}

    describe '#host_name' do
      it 'returns the host the name' do
        party.users << user_1
        party.users << user_2
        party.users << user_3
        expect(party.host_name(user_1.id)).to eq(user_1.name)
      end
    end

    describe '#invited' do
      it 'returns list of invitees' do
        party.users << user_1
        party.users << user_2
        party.users << user_3
        expect(party.invited(user_1.id)).to eq([user_2, user_3])
      end
    end
  end
end
