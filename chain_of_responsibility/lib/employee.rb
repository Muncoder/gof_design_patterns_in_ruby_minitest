class Employee
  attr_reader :chief

  def initialize(options = {})
    @chief = options[:chief]
  end

  def name
    "John Doe"
  end

  def method_missing(*args, &block)
    # require 'pry'; binding.pry

    method = args.shift
    if method.to_s.include? "department_"
      chief.send(method, *args, &block)
    else
      super *args, &block
    end
  end
end