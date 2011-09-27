class HelloWorld

  def run vm

    # Write string to memory, after reserved section.
    vm.cis.mov_str_to_addr 0x04, "Hello, world!\n"

    # Push string address and length.
    vm.cis.push_imm 14
    vm.cis.push_imm 0x04

    # System call: write()
    vm.mov_imm_to_reg :a, 4
    vm.int 0x0

    # Restore stack
    vm.add_imm_to_reg :sp, 2

  end

end
