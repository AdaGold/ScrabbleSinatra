class Scoring

  LETTER_SCORES = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }
  def split_word(words)
    words.split(" ")
  end

  def self.score(word)
    word_score = 0
    word = word.upcase
    letter_array = word.split(//)

    letter_array.each do |letter|
      LETTER_SCORES.each do |key, value|
        if value.include? letter
           word_score += key
        end
      end
    end

    word_score += 50 if letter_array.length == 7

    word_score
  end

  def self.highest_score_from(array_of_words)
    word_hash = {}
    # create a hash where the key is the word and the value is its score
    array_of_words.each do |word|
      word_hash[word] = score(word)
    end

    word_list = []
    # find the highest score value
    max_value = word_hash.max_by { |key, value| value }

    # put all the words with the highest score into an array
    word_hash.each do |key, value|
      if value == max_value[1]
        word_list << key
      end
    end

    # if the word used all 7 letters, it wins
    seven_long = word_list.find {|word| word.length == 7}

    return seven_long unless seven_long.nil?

    # if no words used 7 letters, the shortest one wins
    # or if multiple are shortest, the first one in the array wins
    word_list.min_by {|words| words.length}

  end

end
