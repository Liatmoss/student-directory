@students = [] # an empty array accessible to all methods
require 'csv'

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
    puts "Student's saved"
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    student_inputs(name, "November")
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  puts "What file would you like to save in?"
  user_save = STDIN.gets.chomp
  user_save == "" ? "students.csv" : user_save

  CSV.open(user_save, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Saved #{@students.length} students to file"
end

def load_students(filename = "students.csv")
  puts "What file would you like to load?"
  user_file = STDIN.gets.chomp
  if user_file != ""
    file_name = user_file
  end
  csv_file = CSV.read(filename)
  for entry in csv_file
    p entry
  end
  file = File.open(user_file, "r")
  csv_file.each do |line|
  name, cohort = line
  student_inputs(name, cohort)
  end
end

def try_load_students
ARGV.first ? filename = ARGV.first : filename = "students.csv"
  puts filename
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def student_inputs(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
