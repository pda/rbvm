require_relative "vm"
require_relative "vm/core"
require_relative "vm/kernel"

vm = VM::Core.new
kernel = VM::Kernel.new(vm)

require_relative "hello_world"
kernel.run(HelloWorld.new(vm))
kernel.run(HelloWorld.new(vm))
