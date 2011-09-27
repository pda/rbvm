require_relative "vm"
require_relative "cis"

VM.new.tap do |vm|

  cis = Cis.new(vm)

  p vm

  # Push "a", "d", "p" onto stack.
  cis.push_imm "a"
  cis.push_imm "d"
  cis.push_imm "p"

  p vm

  # Pop into :a, :b, :c registers.
  cis.pop_reg :a
  cis.pop_reg :b
  cis.pop_reg :c

  p vm

end
