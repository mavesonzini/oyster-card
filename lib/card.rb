require_relative 'journey.rb'

class Oystercard

  attr_reader :balance, :entry_station, :journeys

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

    def initialize
      @balance = 0
      @journeys = []
    end

    def top_up(amount)
      raise "Cannot top up: balance capacity of #{MAXIMUM_BALANCE} has been exceeded" if balance + amount > MAXIMUM_BALANCE
      @balance += amount
    end

     def touch_in(station)
       raise "Cannot touch in: not enough funds" if balance < MINIMUM_BALANCE
       @entry_station = station
      #  @exit_station = nil
     end

     def touch_out(station)
       @balance -= MINIMUM_BALANCE
       exit_station = station
       journey = store_journey(entry_station,exit_station)
       @journeys << journey
       @entry_station = nil
     end

     def in_journey?
       !!entry_station
     end

     private

     def deduct(amount)
       @balance -= amount
     end

     def store_journey(entry_station,exit_station)
       {entry_station => exit_station}
     end
  end
