# 40 was chosen as the paramter for each use of the center method as that is just above
# the longest output message
# Let's put all students into an array of hashes
def input_students
  puts "Please enter the names of the students".center(40)
  puts "To finish, just hit return twice".center(40)
  # create and empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.length} students".center(40)
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students".center(40)
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)