require_relative "vm"
require_relative "vm/core"
require_relative "vm/kernel"

vm = VM::Core.new
kernel = VM::Kernel.new(vm)


