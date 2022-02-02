require 'rails_helper'

RSpec.describe CastMember do
  it 'exists' do
    cast_member = CastMember.new(name: "Brad Pitt", character: "Tyler Durden")
    expect(cast_member).to be_an_instance_of(CastMember)
  end

  it 'has attributes' do
    cast_member = CastMember.new(name: "Brad Pitt", character: "Tyler Durden")
    expect(cast_member.name).to eq("Brad Pitt")
    expect(cast_member.character).to eq("Tyler Durden")
  end
end 
