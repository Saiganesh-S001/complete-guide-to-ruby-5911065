class Radio
  attr_reader :volume, :band# will create setters later in the code
  # attrs -> vol, band, frequency

  @@fm_freqs = 88.0..108.0 # range for fm freq
  @@am_freqs = 540.0..1600.0 # range for am freq

  @@default_fm = 95.5
  @@default_am = 1010.0

  def self.am(options = {})
    options.merge!({band: 'AM'})
    Radio.new(options)
  end

  def self.fm(options = {})
    options.merge!({band: 'FM'})
    Radio.new(options)
  end

  def initialize(options = {})
    self.volume = options[:volume] || 7 # will be setting the default later
    self.band = options[:band] || 'FM'
    @fm_freq = @@default_fm
    @am_freq = @@default_am
    self.frequency = options[:frequency]
  end

  # setters

  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end

  def band=(value)
    return unless ['AM','FM'].include?(value)
    @band = value
  end

  def frequency #getter method for frequency
    @band == 'AM' ? @am_freq : @fm_freq
  end

  def frequency=(value) #setter method for frequency
    value = value.to_f
    return unless allowed_range.include?(value)
    if @band == 'AM'
      @am_freq = value
    else 
      @fm_freq = value
    end
  end

  def status
    "station: #{frequency} #{band}, volume: #{volume}"
  end

private
  def allowed_range
    return @band == 'AM' ? @@am_freqs : @@fm_freqs
  end

end