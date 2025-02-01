
class Person
  attr_accessor :first_name, :last_name, :noise

  def initialize(options = {})
    puts "Hello Human"
    @noise = options[:noise]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def say_name
    "#{get_initial(first_name)} #{last_name}"
  end

  def say_hello
    puts "Hello World"
  end

private
  def get_initial(name)
    name[0] + "."
  end
end