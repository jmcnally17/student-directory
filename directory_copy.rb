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
  count = 0
  # create count to indicate where in the students array the loop is 
  while count < students.length
  # count equalling the length of the students array indicates we are at the end of the 
  # list and need to break out of the loop
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
    # add 1 to the count to move onto the next student in the array
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