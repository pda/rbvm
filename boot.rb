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

%w{hello.asm addition.asm}.each do |asm|
  puts "\nLexer"
  instructions = lexer.instructions File.open(asm)
  instructions.each &method(:p)

  puts "\nParser"
  program = parser.parse instructions
  program.each &method(:p)

  puts "\nLoader"
  loader.load program

  puts "\nRunning"
  vm.run
end
