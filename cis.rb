# Complex instruction set.
class Cis

  def initialize vm
    @vm = vm
  end

  attr_reader :vm

  # Push immediate value onto stack.
  def push_imm imm
    vm.mov_imm_to_reg_addr :sp, imm
    vm.add_imm_to_reg :sp, -1
  end

  # Pop value into register.
  def pop_reg reg
    vm.add_imm_to_reg :sp, 1
    vm.mov_reg_addr_to_reg reg, :sp
  end

end
