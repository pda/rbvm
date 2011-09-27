class VM::Loader

  def initialize vm
    @vm = vm
  end

  attr_reader :vm

  def load program
    start = 0x04 # skip interrupt table
    program.each_with_index do |op, i|
      puts "Loading #{op.inspect} into 0x%02X" % (start + i)
      vm.mov_imm_to_addr start + i, op
    end
    puts "Loading terminator into 0x%02X" % (start + program.length)
    vm.mov_imm_to_addr start + program.length, 0
    puts "Setting :op to 0x%02X" % start
    vm.mov_imm_to_reg :op, start
  end

end
