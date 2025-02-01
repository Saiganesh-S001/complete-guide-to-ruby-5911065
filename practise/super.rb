class Sofa
  attr_accessor :len, :width

  def initialize(len,width)
    @len = len
    @width = width
  end

  def area
    len*width
  end
end

class SofaBed < Sofa
  attr_accessor :is_open, :open_len
  def initialize(is_open = false, open_len)
    @is_open = is_open
    @open_len = open_len
  end
  def area
    is_open ? open_len*width : super # for calling the parents method, the child class must override the parents method.
  end
end

sofa = SofaBed.new(false,12)
sofa.len = 10
sofa.width = 10

puts sofa.area

