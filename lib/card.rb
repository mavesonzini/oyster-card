class Oystercard

  attr_reader :balance, :entry_station

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

    def initialize
      @balance = 0
    end

    def top_up(amount)
      raise "Cannot top up: balance capacity of #{MAXIMUM_BALANCE} has been exceeded" if balance + amount > MAXIMUM_BALANCE
      @balance += amount
    end

     def touch_in(station)
       raise "Cannot touch in: not enough funds" if balance < MINIMUM_BALANCE
       @entry_station = station
     end

     def touch_out
       @balance -= MINIMUM_BALANCE
       @entry_station = nil
     end

     def in_journey?
       !!entry_station
     end

     private

     def deduct(amount)
       @balance -= amount
     end

  end
