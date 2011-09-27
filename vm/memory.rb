class VM::Memory

  def initialize size
    @size = size
    @mem = Array.new size, 0
  end

  attr_accessor :size

  def [] index
    check_bounds index
    @mem[index]
  end

  def []= index, value
    check_bounds index
    @mem[index] = value
  end

  private

  def check_bounds index
    if index < 0 || index >= size
      raise "Memory out of bounds: 0x%02X" % index
    end
  end

end
