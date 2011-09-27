require_relative "vm"
require_relative "vm/core"
require_relative "vm/cis"
require_relative "vm/kernel"

VM::Core.new.tap do |vm|

  # Complex instructions (push, pop, etc)
  cis = VM::Cis.new(vm)

  kernel = VM::Kernel.new(vm)

  # Push "pda\n" and its length onto stack.
  cis.push_imm "\n".ord
  cis.push_imm "a".ord
  cis.push_imm "d".ord
  cis.push_imm "p".ord
  cis.push_imm 4

  vm.mov_imm_to_reg :a, 4  # write()
  vm.int 0x0

  vm.add_imm_to_reg :sp, 5

end
