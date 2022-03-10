# create students as an instance vaiable so it can be used in all methods
@students = []

# Let's put all students into an array of hashes
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    cohort = "november"
    student_info(name, cohort)
    puts "Now we have #{@students.length} student" if @students.length == 1
    puts "Now we have #{@students.length} students" if @students.length != 1
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.length} great student" if @students.length == 1
  puts "Overall, we have #{@students.length} great students" if @students.length != 1
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      # cause the program to terminate
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  filename = "students.csv" if ARGV.first == nil
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    student_info(name, cohort)
  end
  file.close
  puts "Loaded students from #{filename}"
end

def interactive_menu
  loop do
    # print the menu and ask the user what to do
    print_menu
    # run the process method to give the user the options
    process(STDIN.gets.chomp)
  end
end


def student_info(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


# Nothing happens until we call the method
try_load_students
interactive_menu