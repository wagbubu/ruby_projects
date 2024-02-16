def caesar_cipher(string, shift)
  # Convert to ASCII arayy
  ords = string.bytes
  ciphered_ords = []
  # for each item in Array

  for ord in ords
    # IF STATEMENTS TO ONLY CIPHER LETTERS and NOT SYMBOLS,SPACES,NUMBERS ETC.
    if ord >= 65 && ord <= 90 #If Within Capital Letters
      ciphered_ord = ord + shift
      if ciphered_ord > 90
        #If it exceeds the range where capital letters located in ascii table
        #Subtract the max range from the sum of shift and ords,
        #then add back the base - 1 or minimum - 1
        #it will start again at where the big letters are located at.
        #eg. will start from A again..
        #We get the modulo of it, if the difference between ciphered ORD and  90 is less than 26 then
        #it will just return it self
        #if it exceeds 26 it will get the remainder by doing this we can avoid
        #exceeding from the ascii table if user puts huge number like 69 or 420
        #We chose 26 so that when the difference is equal to 27 it will just have remainder 1 adding 64 = 65
        #and will be A
        ciphered_ords.push(((ciphered_ord - 90) % 26) + 64)
      else
        ciphered_ords.push(ciphered_ord)
      end
    elsif ord >= 97 && ord <= 122 #If Within small letters
      ciphered_ord = ord + shift
      if ciphered_ord > 122
        #same is done at small letters
        ciphered_ords.push(((ciphered_ord - 122) % 26) + 96)
      else
        ciphered_ords.push(ciphered_ord)
      end
    else #If Symbols, Spaces, Etc.. don't do anything just push it to the array
      ciphered_ords.push(ord)
    end

  end

  ciphered_phrase = ciphered_ords.map {|ciphered_ord| ciphered_ord.chr}.join("")
end

puts caesar_cipher('What a string!', 420)
