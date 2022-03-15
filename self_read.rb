# File.read is used to read the source code of a particular file. Combined with
# __FILE__ which will read the file currently being executed.
puts File.read(__FILE__)