class VM::Kernel

  def initialize vm
    @vm = vm
  end

  attr_reader :vm

  def run program
    register_interrupt_handlers
    program.run
  end

  private

  # First four memory units are interrupt handlers.
  def register_interrupt_handlers
    vm.mov_handler_to_addr 0, method(:syscall_handler)
  end

  def syscall_handler
    syscall_lookup(vm.read_reg(:a)).call
  end

  def reserved_handler
    raise "Reserved handler"
  end

  def syscall_lookup index
    case index
    when 4 then method(:syscall_write)
    else raise("Invalid system call: #{index}")
    end
  end

  # Reads length and address from stack.
  # Writes <length> bytes from <address> to stdout.
  def syscall_write
    buffer = ""
    addr = vm.read_mem(vm.read_reg(:sp) + 1)
    vm.read_mem(vm.read_reg(:sp) + 2).times do |i|
      buffer << vm.read_mem(addr + i).chr
    end
    print buffer
  end

end
