class Animal
  attr_accessor :noise , :color

  def initialize(options = {})
    @noise = options[:noise] || "quirk"
    @color = options[:color] || "default"
  end

  def self.create_an_animal
    Animal.new(noise: "Oink", color:"pink")
  end
  def sleep
    puts "#{self.class.name} sleeps"
  end
end