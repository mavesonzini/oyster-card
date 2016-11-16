require 'journey.rb'

describe Journey do

  subject(:journey) {described_class.new}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it { is_expected.to respond_to(:entry_station)}
  it { is_expected.to respond_to(:exit_station)}

  it { is_expected.to respond_to(:start_journey).with(1).argument }

  it { is_expected.to respond_to(:end_journey).with(1).argument }

  describe '#start_journey' do

    it 'sets entry station' do
      subject.start_journey(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

  end

  describe '#end_journey' do

    it 'sets exit station' do
      subject.end_journey(exit_station)
      #####

    end





end
