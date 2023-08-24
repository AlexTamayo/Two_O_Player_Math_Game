class MathProblem
  attr_accessor :operation, :num1, :num2, :solution

  def initialize
    @operation = ""
    @num1 = 0
    @num2 = 0
    @solution = 0
  end

  def operation_logic
    generate_problem

    case @operation
      when :addition
        @solution = @num1 + @num2
        "What does #{@num1} plus #{@num2} equal?"
        
      when :subtraction
        @solution = @num1 - @num2
        "What does #{@num1} minus #{@num2} equal?"

      when :multiplication
        @solution = @num1 * @num2
        "What does #{@num1} times #{@num2} equal?"

      when :division
        @solution = @num1 / @num2
        "What does #{@num1} divided by #{@num2} equal?"
    end
  end

  private

  def generate_problem
    loop do
      @num1 = rand(1...10)
      @num2 = rand(1...10)
      @operation = choose_operation

      break unless invalid_problem?
    end
  end

  def choose_operation
    [:addition, :subtraction, :multiplication, :division].sample
  end

  def invalid_problem?
    (@operation == :subtraction && @num1 < @num2) ||
    (@operation == :division && (@num2 == 0 || !whole_number?(@num1.to_f / @num2)))
  end

  def whole_number?(num)
    num % 1 == 0
  end

end



if __FILE__ == $0

  puts ""
  
  math = MathProblem.new
  
  puts math.operation_logic
  puts math.solution
  puts ""
  
  puts math.operation_logic
  puts math.solution
  puts ""
  
  puts math.operation_logic
  puts math.solution
  puts ""

  
end