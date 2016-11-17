require 'card.rb'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { double :journey }

  describe "#initialization" do

    it 'starts with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'starts off not on a journey' do
      expect(subject.in_journey?).to eq false
    end

    it 'starts with no journeys' do
      expect(subject.journeys).to be_empty
    end

  end

  it { is_expected.to respond_to(:touch_in).with(1).argument }

  it { is_expected.to respond_to(:touch_out).with(1).argument }

  it { is_expected.to respond_to(:entry_station)}

  describe "#top_up" do

    it "should test that balance will change due to amount added" do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it "should raise error if balance is more than 90" do
      maximum_top_up = described_class::MAXIMUM_BALANCE
      subject.top_up(maximum_top_up)
      expect{subject.top_up(100)}.to raise_error("Cannot top up: balance capacity of #{maximum_top_up} has been exceeded")
    end

  end

  describe "#touch_in" do

    it "should raise error if balance is below 1 pound" do
      expect{subject.touch_in(entry_station)}.to raise_error("Cannot touch in: not enough funds")
    end

  end


  context 'card is topped up' do

    before do
      subject.top_up(described_class::MAXIMUM_BALANCE)
      subject.touch_in(entry_station)
    end

    describe "#touch_in" do

      it "should test that card is in journey" do
        expect(subject).to be_in_journey
      end

      it "should save the station to entry_station" do
        expect(subject.entry_station).to eq entry_station
      end

      # it 'should set the exit_station to nil' do
      #   subject.touch_out(exit_station)
      #   subject.touch_in(entry_station)
      #   expect(subject.exit_station).to eq nil
      # end

    end

    describe "#touch_out" do

      # it 'should save the station to exit_station' do
      #   subject.touch_out(exit_station)
      #   expect(subject.exit_station).to eq exit_station
      #
      # end

      it "Test that card can be touched out" do
        subject.touch_out(exit_station)
        expect(subject).not_to be_in_journey
      end

      it "should test that minimum value is deducted from card at touch out" do
        expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-described_class::MINIMUM_BALANCE)
      end

      it "should set entry station to nil" do
        subject.touch_out(exit_station)
        expect(subject.entry_station).to eq nil
      end

      it "should save a complete journey" do
        subject.touch_out(exit_station)
        journey = {entry_station => exit_station}
        expect(subject.journeys).to include journey
      end

    end

  end

end
