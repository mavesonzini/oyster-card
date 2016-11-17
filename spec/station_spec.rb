<<<<<<< HEAD
require 'station.rb'

describe Station do

  describe "#initialization" do
    subject(:station) { described_class.new("Old Street", 1) }

    it 'has a name' do
      expect(subject.name).to eq "Old Street"
    end

    it 'has a zone' do
      expect(subject.zone).to eq 1
    end
  end
=======
require "station"

describe Station do

  subject(:station) {described_class.new}

  it "should respond to name" do
    expect(station).to respond_to :name
  end

>>>>>>> 167b87d90f10b4eb1cde103e348fe79ce5f0f7c1
end
