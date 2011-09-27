# Basic integer additio
# Limited to single digit result due to poor ASCII conversion.
class Addition
  def run vm

    # Perform addition
    vm.mov_imm_to_reg :a, 2
    vm.add_imm_to_reg :a, 4

    # Convert single digit integer to ASCII
    vm.add_imm_to_reg :a, 0x30

    # Buid result string in memory
    vm.cis.mov_str_to_addr 0x04, "2 + 4 = "
    vm.mov_reg_to_addr 0xC, :a
    vm.mov_imm_to_addr 0xD, 0x0A

    # Print 10 charaters from 0x04
    vm.cis.push_imm 10
    vm.cis.push_imm 0x04
    vm.mov_imm_to_reg :a, 4
    vm.int 0
    vm.add_imm_to_reg :sp, 2

  end
end
