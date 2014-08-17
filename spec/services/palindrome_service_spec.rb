require 'rails_helper'

describe "PalindromeService" do
  subject { PalindromeService.new }

  describe "#palindrome?" do
    it "is true for 999" do
      expect(subject.palindrome?(999)).to be(true)
    end

    it "is false for 10" do
      expect(subject.palindrome?(10)).to be(false)
    end

    it "is true for 0" do
      expect(subject.palindrome?(0)).to be(true)
    end

    it "is true for 1" do
      expect(subject.palindrome?(1)).to be(true)
    end

    it "is true for 123321" do
      expect(subject.palindrome?(123321)).to be(true)
    end

    it "is true for 12321" do
      expect(subject.palindrome?(12321)).to be(true)
    end

    it "is true for 0000" do
      expect(subject.palindrome?(0000)).to be(true)
    end
  end

  describe "#nearest_palindrome" do
    it "is 2 for 1" do
      expect(subject.nearest_palindrome(1)).to be(2)
    end

    it "is 11 for 9" do
      expect(subject.nearest_palindrome(9)).to be(11)
    end

    it "is 1001 for 999" do
      expect(subject.nearest_palindrome(999)).to be(1001)
    end

    it "is 10001 for 9999" do
      expect(subject.nearest_palindrome(9999)).to be(10001)
    end

    it "is 12321 for 12311" do
      expect(subject.nearest_palindrome(12311)).to be(12321)
    end

    it "is 1221 for 1111" do
      expect(subject.nearest_palindrome(1111)).to be(1221)
    end

    describe "when it includes the number" do
      it "is 1 for 1" do
        expect(subject.nearest_palindrome(1, true)).to be(1)
      end
      it "is 1111 for 1111" do
        expect(subject.nearest_palindrome(1111, true)).to be(1111)
      end

    end
  end
end
