require_relative 'spec_helper'

# Helper Methods
def create(argument)
  RomanNumeral.new(argument).to_s
end

module RomanNumeralConverter
  describe 'self' do
    it 'has standard Roman alphabet' do
      expect(@@roman_numerals.keys).to eql([?I.to_sym, ?V.to_sym, ?X.to_sym, ?L.to_sym, ?C.to_sym, ?D.to_sym, ?M.to_sym])
    end
    it 'has subtractive notation letters' do
      expect(@@subtractive_notations.keys).to eql(['IV'.to_sym, 'IX'.to_sym, 'XL'.to_sym, 'XC'.to_sym, 'CD'.to_sym, 'CM'.to_sym])
    end
    it 'allows to disable subtractive notation substitution' do
      @@subtractive_notation = false
      expect(create(9).to_s).to eql('VIIII')
      @@subtractive_notation = true
      expect(create(9).to_s).to eql('IX')
    end
  end
  describe RomanNumeral do
    context 'numeric' do
      describe '.new' do
        it 'knows 1 equals "I"' do
          expect(create(1).to_s).to eql('I')
        end
        it 'knows 5 equals to "V"' do
          expect(create(5).to_s).to eql('V')
        end
        it 'knows 10 equals to "X"' do
          expect(create(10).to_s).to eql('X')
        end
        it 'knows 50 equals to "L"' do
          expect(create(50).to_s).to eql('L')
        end
        it 'knows 100 equals to "C"' do
          expect(create(100).to_s).to eql('C')
        end
        it 'knows 500 equals to "D"' do
          expect(create(500).to_s).to eql('D')
        end
        it 'knows 1000 equals to "M"' do
          expect(create(1000).to_s).to eql('M')
        end
        # supports subtractive notation
        it 'knows 4 equals "IV"' do
          expect(create(4).to_s).to eql('IV')
        end
        it 'knows 9 equals "IX"' do
          expect(create(9).to_s).to eql('IX')
        end
        it 'knows 40 equals "XL"' do
          expect(create(40).to_s).to eql('XL')
        end
        it 'knows 90 equals "XC"' do
          expect(create(90).to_s).to eql('XC')
        end
        it 'knows 400 equals "CD"' do
          expect(create(400).to_s).to eql('CD')
        end
        it 'knows 900 equals "CM"' do
          expect(create(900).to_s).to eql('CM')
        end
      end
    end
  end
end
