# Virtual Machine with RISC-like instruction set.
class VM::Core

  MEM_SIZE = 16

  def initialize
    @mem = Array.new MEM_SIZE, 0
    @reg = Struct.new(:sp, :a, :b, :c, :d).new.tap do |reg|
      reg.sp = MEM_SIZE - 1
    end
  end

  # Move immediate value into address pointed to by register.
  def mov_imm_to_reg_addr reg, imm
    @mem[@reg[reg]] = imm
  end

  # Move immediate value to register.
  def mov_imm_to_reg reg, imm
    @reg[reg] = imm
  end

  # Add immediate value to register.
  def add_imm_to_reg reg, imm
    @reg[reg] += imm
  end

  # Move value at address pointed to by src register into dest register.
  def mov_reg_addr_to_reg dst, src
    @reg[dst] = @mem[@reg[src]]
  end

end
