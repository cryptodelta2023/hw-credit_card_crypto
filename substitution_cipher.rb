module SubstitutionCipher
  # module Caesar works to shift every input letter their position according to key
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      result_key = key % 26
      # result = document.to_s.chars.map { |c| c.ord }
      # result = document.to_s.bytes
      result = document.to_s.bytes.map { |char| char + result_key }
      result.map(&:chr).join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      result_key = key % 26
      # result = document.to_s.chars.map { |c| c.ord }
      # result = document.to_s.bytes
      result = document.to_s.bytes.map { |char| char - result_key }
      result.map(&:chr).join
    end
  end

  # module Permutation works to randomly shuffle every input letter according to key
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      rand_key = (0..127).to_a.shuffle(random: Random.new(key))
      result = document.to_s.split('').map do |e|
        rand_key[e.ord].chr
      end
      result.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      rand_key = (0..127).to_a.shuffle(random: Random.new(key))
      result = document.to_s.split('').map do |d|
        rand_key.index(d.ord).chr
      end
      result.join
    end
  end
end
