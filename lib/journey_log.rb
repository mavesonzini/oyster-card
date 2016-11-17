class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
  end

  def start
    new_journey = Journey.new
    new_journey.start_journey(entry_station)
  end

end
