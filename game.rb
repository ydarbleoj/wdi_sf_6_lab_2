game_on = true 
pages_with_questions = {}

lines_grabbed = ""
key = ""

File.open("story.txt", "r") do |infile|
  while (line = infile.gets)
    if line.index("~p") 
      key = line
      lines_grabbed = "" 
    else 
      lines_grabbed += line 
    end
    pages_with_questions[key] = lines_grabbed
  end
end

while game_on

  p1 = pages_with_questions.select do |key, value| 
    key.index('~p1')
  end 
   
  i = 1
  p1.each do |k, v|
    if k.match /^~p\d$/
      puts v
    else 
      puts "#{i}. #{v}"
      i += 1
    end 
  end 

  puts "I'\ll do..."
  choice = gets.to_i 

  breakfast = pages_with_questions.select { |k| k.index("~p#{choice + 1}")}
  breakfast.each { |k,v| puts v }
  puts 'Still hungary? (Yes or No)'
  choice = gets.chomp

  if (choice == 'Yes')
    game_on 
  else 
    game_on = false 
  end 
end 


















