def can_make_ransom_note?(note, text)
  words_hash = {}
  words = text.split(' ')
  words.each { |w| words_hash[w] = true }

  note.split(' ').each do |w|
    return false unless words_hash.has_key? w
  end

  true
end

text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo cupiditate accusamus sequi magnam, iste incidunt. Accusamus vel eaque, doloribus. Ullam amet veritatis illo rerum ab necessitatibus doloremque. Qui, magnam, odio.'

note1 = 'I want candy'
note2 = 'Lorem Nemo dolor sit'

puts can_make_ransom_note?  note1, text
puts can_make_ransom_note?  note2, text
