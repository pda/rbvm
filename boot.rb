require_relative "vm"
require_relative "vm/core"
require_relative "vm/kernel"
require_relative "vm/lexer"
require_relative "vm/parser"
require_relative "vm/loader"

vm = VM::Core.new
kernel = VM::Kernel.new(vm)
lexer = VM::Lexer.new
parser = VM::Parser.new
loader = VM::Loader.new(vm)


