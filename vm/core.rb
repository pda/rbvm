require_relative "memory"
require_relative "cis"

# Virtual Machine with RISC-like instruction set.
class VM::Core

  def initialize
    @mem = VM::Memory.new(0x20)
    @reg = Struct.new(:sp, :a, :b).new.tap do |reg|
      reg.sp = @mem.size - 1
    end
    @cis = VM::Cis.new(self)
  end

  attr_reader :cis

  # Add immediate value to register.
  def add_imm_to_reg reg, imm
    @reg[reg] += imm
  end

  # Software interrupt.
  def int imm
    @mem[imm].call
  end

  # Move a handler Proc to the specified address.
  def mov_handler_to_addr addr, handler
    @mem[addr] = handler
  end

  # Move immediate value to memory.
  def mov_imm_to_addr addr, imm
    @mem[addr] = imm
  end

  # Move immediate value to register.
  def mov_imm_to_reg reg, imm
    @reg[reg] = imm
  end

  # Move immediate value into address pointed to by register.
  def mov_imm_to_reg_addr reg, imm
    @mem[@reg[reg]] = imm
  end

  # Move value at address pointed to by src register into dest register.
  def mov_reg_addr_to_reg dst, src
    @reg[dst] = @mem[@reg[src]]
  end

  # Return the value of a register.
  # This doesn't seem VM-like :(
  def read_reg reg
    @reg[reg]
  end

  # Return the value of a memory location.
  # This doesn't seem VM-like :(
  def read_mem addr
    @mem[addr]
  end

end
