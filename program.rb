class Program

  def initialize vm
    @vm = vm
    @cis = VM::Cis.new(vm)
  end

  private

  attr_reader :vm, :cis

end
