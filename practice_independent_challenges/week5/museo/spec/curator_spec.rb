require 'rspec'
require_relative '../lib/curator.rb'

RSpec.describe 'Curator' do
  it 'exists and has the correct attributes' do
    curator = Curator.new

    expect(curator).to be_a(Curator)
    expect(curator.photographs).to eq([])
    expect(curator.artists).to eq([])
  end
end
