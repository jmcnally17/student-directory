# Let's put all students into an array of hashes
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create and empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.length} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Give me the letter that each students name begins with that you would like to see"
  letter = gets.chomp
  # takes input from the user so they can decide which letter they want to see
  students.each_with_index do |student, index|
    student[:name][0] == letter.upcase ? (puts "#{student[:name]} (#{student[:cohort]} cohort)") : next
    # use the letter given from the input to show students whose name begins with that letter
    # the .upcase makes sure the input is capitalised
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)