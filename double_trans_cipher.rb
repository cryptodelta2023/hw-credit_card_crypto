module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    doc = document.to_s
    $len = doc.length # make length of doc visible to decrypt function
    # 1.
    @cols = Math.sqrt(doc.length).to_i + 1
    @rows = @cols # make matrix square, so key won't run out of index for rows
    # 2.
    @plaintext = Array.new(@rows) { Array.new(@cols) }
    @plaintext = @plaintext.map.with_index do |subarray, i|
      subarray.map.with_index do |_item, j|
        (@cols * i + j) < doc.length ? doc[@cols * i + j] : '-' # pad with '-' if num of chars is not square of an integer
      end
    end
    # 3. 4. shuffle rows and cols
    @key_arr = (0..@cols - 1).to_a
    @key_arr = @key_arr.shuffle(random: Random.new(key))
    @encrypted = Array.new(@rows) { Array.new(@cols) }
    @encrypted = @encrypted.map.with_index do |subarray, i|
      subarray.map.with_index do |_, j|
        @plaintext[@key_arr[i]][@key_arr[j]]
      end
    end
    # 5. 
    subarr = []
    @encrypted.each do |subarray|
      subarr << subarray.join('')
    end
    subarr.join('') # return ciphertext
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    @decrypted = Array.new(@rows) { Array.new(@cols) { '' } }
    # shuffle rows, cols
    @decrypted.each_with_index do |subarray, i|
      subarray.each_with_index do |_, j|
        @decrypted[@key_arr[i]][@key_arr[j]] = @encrypted[i][j] # use @encrypted from encrypt()
      end
    end
    # 5.
    # join ciphertext
    subarr = []
    @decrypted.each do |subarray|
      subarr << subarray.join('')
    end
    subarr.join('').slice(0..$len-1) # plaintext needs to be truncated
  end
end

