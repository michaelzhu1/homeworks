class Employee
  attr_reader :name, :salary, :title
  attr_accessor :boss
  def initialize(name, salary, title, boss =nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self)
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end
end


class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss)
    super(name, salary, title, boss)
    @employees = []
  end


  def add_employee(subor)
    @employees << subor
  end


  def bonus(multiplier)
    multiplier * get_salaries
  end

  def get_salaries
    return @salary if self.employees.nil?
    total = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        total += employee.get_salaries
      end
      total += employee.salary
    end
    total
  end
end

ned = Manager.new("Ned", 1_000_000, "Founder", nil)
shawna = Employee.new("Shawna", 12_000, "TA")
david = Employee.new("David", 10_000, "TA")
darren = Manager.new("Darren", 78_000, "TA Manager", ned)

darren.boss=(ned)
david.boss=(darren)
shawna.boss=(darren)



puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
