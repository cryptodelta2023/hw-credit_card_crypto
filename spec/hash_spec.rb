require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'Check that each card produces the same hash if hashed repeatedly' do
        cards.each do |card|
          _(card.hash).must_equal card.hash
          _(card).wont_be_nil
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'Check that each card produces a different hash than other cards' do
        hashed = cards.map(&:hash)
        _(hashed.uniq.length).must_equal 3
      end
    end

    describe 'Test cryptographic hashing' do
      describe 'Check hashes are consistently produced' do
        # TODO: Check that each card produces the same hash if hashed repeatedly
        it 'Check that each card produces the same hash if hashed repeatedly' do
          cards.each do |card|
            _(card.hash_secure).must_equal card.hash_secure
            _(card).wont_be_nil
          end
        end
      end

      describe 'Check for unique hashes' do
        # TODO: Check that each card produces a different hash than other cards
        it 'Check that each card produces a different hash than other cards' do
          hashed = cards.map(&:hash_secure)
          _(hashed.uniq.length).must_equal cards.length
        end
      end

      describe 'Check regular hash not same as cryptographic hash' do
        # TODO: Check that each card's hash is different from its hash_secure
        it 'Check that each card hash is different from its hash_secure' do
          cards.each do |card|
            _(card.hash).wont_equal card.hash_secure
          end
        end
      end
    end
  end
end

