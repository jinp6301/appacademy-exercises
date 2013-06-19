def file_shuffler(file_name)
  line_array = File.readlines(file_name)
  line_array.shuffle!
  File.open("#{file_name}-shuffled.txt", 'w') do |file|
    line_array.each do |orig_line|
      file.puts orig_line
    end
  end
end