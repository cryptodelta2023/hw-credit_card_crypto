# frozen_string_literal: true

require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020',
                         'Soumya Ray', 'Visa')
    @key = 3
  end

  # describe 'Using Caesar cipher' do
  #   it 'should encrypt card information' do
  #     enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
  #     _(enc).wont_equal @cc.to_s
  #     _(enc).wont_be_nil
  #   end

  #   it 'should decrypt text' do
  #     enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
  #     dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
  #     _(dec).must_equal @cc.to_s
  #   end
  # end

  # describe 'Using Permutation cipher' do
  #   it 'should encrypt card information' do
  #     enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
  #     _(enc).wont_equal @cc.to_s
  #     _(enc).wont_be_nil
  #   end

  #   it 'should decrypt text' do
  #     enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
  #     dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
  #     _(dec).must_equal @cc.to_s
  #   end
  # end

  # # shuan
  # describe 'Using Double Transposition cipher' do
  #   it 'should encrypt card information' do
  #     enc = DoubleTranspositionCipher.encrypt(@cc, @key)
  #     _(enc).wont_equal @cc.to_s
  #     _(enc).wont_be_nil
  #   end

  #   it 'should decrypt text' do
  #     enc = DoubleTranspositionCipher.encrypt(@cc, @key)
  #     dec = DoubleTranspositionCipher.decrypt(enc, @key)
  #     _(dec).must_equal @cc.to_s
  #   end
  # end

  # TODO: Add tests for double transposition and modern symmetric key ciphers
  #       Can you DRY out the tests using metaprogramming? (see lecture slide)

  ciphers = ['Caesar', 'Permutation', 'Double Transposition']
  ciphers.each do |name|
    describe "Using #{name} cipher" do
      it 'should encrypt card information' do
        enc = SubstitutionCipher::Caesar.encrypt(@cc, @key) if name == 'Caesar'
        enc = SubstitutionCipher::Permutation.encrypt(@cc, @key) if name == 'Permutation'
        enc = DoubleTranspositionCipher.encrypt(@cc, @key) if name == 'Double Transposition'
        _(enc).wont_equal @cc.to_s
        _(enc).wont_be_nil
      end

      it 'should decrypt text' do
        if name == 'Caesar'
          enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
          dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
        elsif name == 'Permutation'
          enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
          dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
        else name == 'Double Transposition'
          enc = DoubleTranspositionCipher.encrypt(@cc, @key)
          dec = DoubleTranspositionCipher.decrypt(enc, @key)
        end
        _(dec).must_equal @cc.to_s
      end
    end
  end
end
