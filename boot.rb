require_relative "vm"
require_relative "vm/core"
require_relative "vm/kernel"

vm = VM::Core.new
kernel = VM::Kernel.new(vm)

require_relative "hello_world"
require_relative "addition"

kernel.run HelloWorld.new
kernel.run Addition.new
