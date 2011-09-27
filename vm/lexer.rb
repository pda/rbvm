class VM::Lexer

  def instructions io
    instructions = []
    io.each_line.map do |line|
      line.gsub! /;.*/, ""         # comments
      next if line =~ /^\s*$/
      instructions << parse_line(line)
    end
    instructions
  end

  private

  def parse_line line
    m = line.match %r{\s*(\w+)(?:\s+([^,]+)(?:,\s*(.*))?)?}
    [ m[1].to_sym, parse_operand(m[2]), parse_operand(m[3]) ]
  end

  def parse_operand o
    case o
    when nil then nil
    when /0x[0-9a-f]+/i then o.to_i(16)
    when /^"0\d+"$/ then o.to_i(8)
    when /^\d+$/ then o.to_i(10)
    when /^\w+$/ then o.to_sym
    else eval(o)
    end
  end

end
