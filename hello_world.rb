require_relative "program"

class HelloWorld < Program

  def run

    # Push "pda\n" and its length onto stack.
    cis.push_imm "\n".ord
    cis.push_imm "!".ord
    cis.push_imm "o".ord
    cis.push_imm "l".ord
    cis.push_imm "l".ord
    cis.push_imm "e".ord
    cis.push_imm "H".ord
    cis.push_imm 7

    # System call: write()
    vm.mov_imm_to_reg :a, 4
    vm.int 0x0

    # Restore stack
    vm.add_imm_to_reg :sp, 5

  end

end
