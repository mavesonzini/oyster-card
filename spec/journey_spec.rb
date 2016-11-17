require 'journey.rb'

describe Journey do

  subject(:journey) {described_class.new}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it { is_expected.to respond_to(:entry_station)}
  it { is_expected.to respond_to(:exit_station)}



  it { is_expected.to respond_to(:end_journey).with(1).argument }

  

  describe '#end_journey' do

    it 'sets exit station' do
      subject.end_journey(exit_station)
      #####
    end
  end

  describe "#fare" do
    it { is_expected.to respond_to(:fare) }

    it "returns the minimum fare" do
      subject.start_journey("aldgate")
      subject.end_journey("kingsx")
      expect(subject.fare).to eq Oystercard::MINIMUM_BALANCE
    end

    it "returns a penalty fare of 6 if you do not either start your journey or end your journey" do
      subject.start_journey("aldgate")
      subject.end_journey(nil)
      expect(subject.fare).to eq Journey::PENALTY
    end

  end





end
