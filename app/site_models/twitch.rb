class Twitch

  attr_reader :game, :logo, :streamer, :url, :views, :followers

  def initialize(attributes={})
    @game       = attributes[:game]
    @logo       = attributes[:channel][:logo]
    @streamer   = attributes[:channel][:name]
    @url        = attributes[:channel][:url]
    @views      = attributes[:channel][:views]
    @followers  = attributes[:channel][:followers]
  end


  def self.get_streams
    TwitchService.find.map do |stream|
      new(stream)
    end
  end

end