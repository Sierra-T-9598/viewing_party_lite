require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    review = Review.new(author: 'Goddard', content: 'blah blah')
    expect(review).to be_an_instance_of(Review)
  end

  it 'has attributes' do
     review = Review.new(author: 'Goddard', content: 'blah blah')
     expect(review.author).to eq('Goddard')
     expect(review.content).to eq('blah blah')
  end
end
