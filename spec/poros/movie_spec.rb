require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    data = {id: 550,
            title: "Fight Club",
            vote_average: 8.4,
            runtime: 139,
            overview: "blah",
            genres: {id: 1, name: 'drama'},
            poster_path: "/daudhakjf.jpg"
            }

    fight = Movie.new(data)
    expect(fight).to be_an_instance_of(Movie)
  end

  it 'has attributes' do
    data = {id: 550,
            title: "Fight Club",
            vote_average: 8.4,
            runtime: 139,
            overview: "blah",
            genres: {id: 1, name: 'drama'},
            poster_path: "/daudhakjf.jpg"
            }

    fight = Movie.new(data)
    expect(fight.id).to eq(550)
    expect(fight.title).to eq("Fight Club")
    expect(fight.vote_average).to eq(8.4)
    expect(fight.runtime).to eq(139)
    expect(fight.summary).to eq("blah")
    expect(fight.genres).to eq({id:1, name: 'drama'})
    expect(fight.poster_path).to eq("/daudhakjf.jpg")
  end
end
