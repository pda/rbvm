class VM::Kernel

  def initialize vm
    @vm = vm
    @cis = VM::Cis.new(vm)
  end

  attr_reader :vm, :cis

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

  def syscall_write
    vm.read_mem(vm.read_reg(:sp) + 1).times do |i|
      putc vm.read_mem(vm.read_reg(:sp) + 2 + i)
    end
  end

end
