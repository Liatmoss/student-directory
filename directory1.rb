def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Students favourite hobby"
  hobby = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get another name and hobby from the user
    puts "Please enter the names of the students"
    name = gets.chomp
    puts "Students favourite hobby"
    hobby = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

@students_by_cohort = {}

def print(students)
students.each do |x|
  c = x[:cohort]
  n = x[:name]

  if @students_by_cohort[c] == nil
    @students_by_cohort[c] = []
  end
  @students_by_cohort[c].push(n)
  end
  puts @students_by_cohort.to_a
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
