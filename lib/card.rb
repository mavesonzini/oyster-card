class Oystercard

  attr_reader :balance

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

    def initialize
      @balance = 0
      @in_journey = false
    end

    def top_up(amount)
      raise "Cannot top up: balance capacity of #{MAXIMUM_BALANCE} has been exceeded" if balance + amount > MAXIMUM_BALANCE
      @balance += amount
    end

     def touch_in
       raise "Cannot touch in: not enough funds" if balance < MINIMUM_BALANCE
       @in_journey = true
     end

     def touch_out
       @balance -= MINIMUM_BALANCE
       @in_journey = false
     end

     def in_journey?
       @in_journey
     end

     private

     def deduct(amount)
       @balance -= amount
     end

  end
