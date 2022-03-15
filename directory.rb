require "csv"
# create students as an instance vaiable so it can be used in all methods
@students = []

def try_load_students
  # keep asking the user until a valid response is given
  loop do
  # ask if they want to load students in straight away
  puts "Would you like to load students from a file? (yes/no)"
  # get the users choice from input
  choice = STDIN.gets.chomp
    if choice == "yes"
      load_students
      # come out of loop when valid response is given
      break
    elsif choice == "no"
      puts "Very well, you have chosen not to"
      # come out of loop when valid response is given
      break
    else
      puts "I don't know what you mean, try again"
    end
  end
end

def load_students
  puts "Which file would you like to load students from?"
  filename = STDIN.gets.chomp
  # check if filename given is valid
  if File.exists?(filename)
    # use the CSV object class to read each row in the file
    CSV.foreach(filename) do |row|
      # assign the name and cohort variables to the appropriate elements in the row
      name, cohort = row[0], row[1]
      student_info(name, cohort)
    end
    puts "Loaded students from #{filename}"
  else
    puts "I'm sorry, that file does not exist"
    puts "Failed to load any students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def options(selection)
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

def interactive_menu
  loop do
    # print the menu and ask the user what to do
    print_menu
    # run the process method to give the user the options
    options(STDIN.gets.chomp)
  end
end

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
    puts "Student successfully added"
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

def show_students
  puts "You have chosen to show the students"
  print_header
  print_students_list
  print_footer
end

def save_students
  # ask which file to save to
  puts "Which file would you like to save to?"
  # take the filename from input
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    # open the file for writing using the CSV object class
    CSV.open(filename, "wb") do |row| 
    # iterate over the array of students
      @students.each do |student|
        # store the student data into an array that will be saved to the csv file
        student_data = [student[:name], student[:cohort]]
        # add the student_data array to the next row in the csv file
        row << student_data
      end
    end
    puts "Students successfully saved to #{filename}"
  else
    puts "I'm sorry, that file does not exist"
  end
end

def student_info(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


# Nothing happens until we call the method
try_load_students
interactive_menu