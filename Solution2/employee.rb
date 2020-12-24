$countTeamA = 0
$countTeamB = 0
$sumSalTeamA = 0
$sumSalTeamB = 0

class Employee

  attr_accessor :Name
  attr_accessor :Id
  attr_accessor :Age
  attr_accessor :Salary
  attr_accessor :Team

  def initialize(name,id,age,salary,team)
    @Name = name
    @Id = id
    @Age = age
    @Salary = salary
    @Team = team
  end

  def to_s
    puts "#{self.Name} | #{self.Id} | #{self.Age} | #{self.Salary} | #{self.Team}"
  end
end

def averageSalary(obj)
  if obj.Team.upcase == "A"
    $countTeamA = $countTeamA + 1
    $sumSalTeamA = $sumSalTeamA + obj.Salary
  elsif obj.Team.upcase == 'B'
    $countTeamB = + $countTeamB + 1
    $sumSalTeamB = $sumSalTeamB + obj.Salary
  end
end

def avgSalOfEmpInEachTeam
  EmpArray.each { |obj| averageSalary(obj) }
  if $countTeamA != 0
    print("Average salary of Team A : ")
    puts $sumSalTeamA/$countTeamA
  else
    puts "TeamA has no employees"
  end
  if $countTeamB != 0
    print("Average salary of Team B : ")
    puts $sumSalTeamB/$countTeamB
  else
    puts "TeamB has no employees"
  end
end

def maxAgeEmployee
  age = Array.new
  EmpArray.each { |obj| age.push(obj.Age)}
  EmpArray[age.index(age.max())].Name
end

def minSalaryEmployee
  sal = Array.new
  EmpArray.each { |obj| sal.push(obj.Salary)}
  EmpArray[sal.index(sal.min())].Name
end

def specificIdEmployeeDetails(id)
  idFlag = FALSE
  EmpArray.each do |obj|
    if(obj.Id == id)
      puts "Name of Employee with ID #{id} : #{obj.Name}"
      puts "Salary of Employee with ID #{id} : #{obj.Salary}"
      idFlag = TRUE
    end
  end
  if(!idFlag)
    puts "No Employee with ID #{id}"
  end
end

def maxSalEmpInEachTeam
  salTeamA = Array.new
  nameTeamA = Array.new
  salTeamB = Array.new
  nameTeamB = Array.new
  EmpArray.each do |obj|
    if obj.Team.upcase=="A"
      salTeamA.push(obj.Salary)
      nameTeamA.push(obj.Name)
    elsif obj.Team.upcase=="B"
      salTeamB.push(obj.Salary)
      nameTeamB.push(obj.Name)
    end
  end
  puts "Name of the person with maximum salary in Team A : #{nameTeamA[salTeamA.index(salTeamA.max())]}"
  puts "Name of the person with maximum salary in Team B : #{nameTeamB[salTeamB.index(salTeamB.max())]}"
end

# Getting Employee details from User
print("Enter number of employees in the organization: ")
numberOfemployees = gets.chomp.to_i
EmpArray = Array.new(numberOfemployees)
i = 0
while i != numberOfemployees
  print("Enter name of Employee#{i+1} :")
  name = gets.chomp!
  print("Enter id of Employee#{i+1} :")
  id = gets.chomp.to_i
  print("Enter age of Employee#{i+1} :")
  age = gets.chomp.to_i
  print("Enter salary of Employee#{i+1} :")
  salary = gets.chomp.to_i
  print("Enter team of Employee#{i+1} :")
  team = gets.chomp!
  EmpArray[i] = Employee.new(name,id,age,salary,team)
  i+=1
end

# Displaying Employee Details
if(EmpArray.length!=0)
  puts "Employee Details are: "
  for obj in EmpArray
    obj.to_s
  end
end

# Average salary of employees in Team A and Team B
avgSalOfEmpInEachTeam

#Average Salary of employees in the company
if $countTeamA != 0 || $countTeamB != 0
  print("Average salary of employees in the company : ")
  puts ($sumSalTeamA+$sumSalTeamB)/($countTeamA+$countTeamB)
else
  puts "No Employees in the company"
end

# Name of the person with the maximum age
maxAgeEmpName = maxAgeEmployee
puts "Name of the person with the maximum age : #{maxAgeEmpName}"

# Age of the person with minimum salary
minSalEmpName = minSalaryEmployee
puts "Age of the person with minimum salary : #{minSalEmpName}"

# Name and salary of a person with specific employee ID
puts "Enter the Id of the Employee to get details: "
specificIdEmployeeDetails(gets.chomp.to_i)


# Name of the person with maximum salary in each team
maxSalEmpInEachTeam


# Sample TestData
=begin
e1 = Employee.new("Tom",101,28,50000.00, 'B')
e2 = Employee.new("Barry",102,32,78000.00, 'A')
e3 = Employee.new("Newton",104,45,60000.00, 'B')
e4 = Employee.new("Alexandar",105,35,150000.00, 'A')
e5 = Employee.new("Iris",103,29,80000.00, 'A')
=end
