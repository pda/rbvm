class VM::Parser

  def parse instructions

    instructions.map do |i|
      if i[0] == :add
        if i[1].is_a? Symbol
          if i[2].is_a? Integer
            [ :add_imm_to_reg, i[1], i[2] ]
          end
        end
      elsif i[0] == :int
        if i[1].is_a? Integer
          [ :int, i[1] ]
        end
      elsif i[0] == :mov
        if i[1].is_a? Integer
          if i[2].is_a? Integer
            [ :mov_imm_to_addr, i[1], i[2] ]
          elsif i[2].is_a? Symbol
            [ :mov_reg_to_addr, i[1], i[2] ]
          elsif i[2].is_a? String
            [ :mov_str_to_addr, i[1], i[2] ]
          end
        elsif i[1].is_a? Symbol
          if i[2].is_a? Integer
            [ :mov_imm_to_reg, i[1], i[2] ]
          end
        end
      elsif i[0] == :push
        if i[1].is_a? Integer
          [ :push_imm, i[1] ]
        end
      end
    end

  end

end
