require_relative "vm"

VM.new.tap do |vm|

  p vm

  # push "a"
  vm.mov_imm_to_reg_addr :sp, "a"
  vm.add_imm_to_reg :sp, -1

  # push "d"
  vm.mov_imm_to_reg_addr :sp, "d"
  vm.add_imm_to_reg :sp, -1

  # push "p"
  vm.mov_imm_to_reg_addr :sp, "p"
  vm.add_imm_to_reg :sp, -1

  p vm

  # pop into :a
  vm.add_imm_to_reg :sp, 1
  vm.mov_reg_addr_to_reg :a, :sp

  # pop into :b
  vm.add_imm_to_reg :sp, 1
  vm.mov_reg_addr_to_reg :b, :sp

  # pop into :c
  vm.add_imm_to_reg :sp, 1
  vm.mov_reg_addr_to_reg :c, :sp

  p vm

end
