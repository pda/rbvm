require_relative "cis"

class VM::Program

  def initialize vm
    @vm = vm
    @cis = VM::Cis.new(vm)
  end

  private

  attr_reader :vm, :cis

end
