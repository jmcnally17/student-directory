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
    # create an array of each month and also the possible empty input for cohort
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""]
    # ask for which cohort they are in
    puts "Which cohort are they in?"
    cohort = gets.chomp.capitalize
    # if the spelling of the month is incorrect, it will skip the next steps and will start
    # the loop again, asking for the cohort
    months.include?(cohort) ? (puts "Valid month") : next
    # puts the student in the cohort of the current month if the user gives an empty input
    cohort = Time.now.strftime("%B") if cohort == ""
    # add the student hash to the array and convert cohort into a symbol
    students << {name: name, cohort: cohort.to_sym}
    # change what is printed, depending on whether or not there is exactly 1 student
    students.length == 1 ? (puts "Now we have #{students.length} student") : (puts "Now we have #{students.length} students")
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
  # create empty array which is where students grouped by cohort will be put into
  cohort_group = {}
  # group the students by cohort
  students.each do |student|
    cohort_group.has_key?(student[:cohort]) ? (cohort_group[student[:cohort]] << ", #{student[:name]}") : (cohort_group[student[:cohort]] = student[:name])
  end
  # print each cohort with the names of the students in them
  cohort_group.each do |cohort, names|
    puts "#{cohort} cohort: #{names}"
  end
end

def print_footer(names)
  # change what is printed, depending on whether or not there is exactly 1 student
  names.length == 1 ? (puts "Overall, we have #{names.length} great student") : (puts "Overall, we have #{names.length} great students")
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)