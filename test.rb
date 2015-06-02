1.upto(10) do |x|
  begin
  raise IndexError, "I hate 5" if x == 5
  puts x
  rescue  => e
  puts e.message
  end
end