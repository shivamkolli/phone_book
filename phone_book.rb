class PhoneBook
  
  def get_words_from_numbers(numbers)
    return [] if numbers.nil? || numbers.length != 10 || numbers.split('').select{|a| [0, 1].include?(a.to_i)}.size > 0
    
    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],
    "6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
    
    dictionary = []
    file_path = "dictionary.txt"
    
    File.readlines(file_path).each do |word|
      dictionary << word.chop.to_s.downcase
    end
    
    keys = numbers.chars.map { |number| letters[number] }
    
    results = {}
    total_number = keys.length - 1
    
    range = (2..total_number) #because we are excluding 0 and 1 from the combinations
    
    for i in range
      first_array = keys[0..i]
      second_array = keys[i + 1..total_number]
      next if first_array.length < 3 || second_array.length < 3
      first_combination = first_array.shift.product(*first_array).map(&:join)
      next if first_combination.nil?
      second_combination = second_array.shift.product(*second_array).map(&:join)
      next if second_combination.nil?
      results[i] = [(first_combination & dictionary), (second_combination & dictionary)]
    end
    
    
    
  end
  
end
