def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Students favourite hobby"
  hobby = gets.chomp
  puts "Student cohort"
  cohort = gets.chomp.to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get another name and hobby from the user
    puts "Please enter the names of the students"
    name = gets.chomp
    puts "Students favourite hobby"
    hobby = gets.chomp
    puts "Student cohort"
    cohort = gets.chomp.to_sym
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length
   puts "#{[i + 1]}#{students[i][:name]} (#{students[i][:cohort]} cohort) #{students[i][:hobby]}"
   i +=1
  end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
