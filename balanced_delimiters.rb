def is_balanced(string)
  delimiters = { '{' => '}', '(' => ')', '[' => ']' }
  stack = []

  string.each_char do |delimiter|
    if delimiters.has_key? delimiter
      stack << delimiters[delimiter]
    else
      return false if delimiter != stack.pop
    end
  end

  return false unless stack.empty?
  true
end

test = []
test << "{[}]"
test << "{}[()]()"
test << "{)"
test << "}{"
test << "()"

test.each do |s|
  puts "#{s} -> #{is_balanced s}"
end
