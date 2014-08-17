class PalindromeService

  def palindrome?(number)
    string, mid, left, right = prepare number

    return true if string.length == 1

    string[0..left] == string[right..string.length].reverse!
  end

  def nearest_palindrome(number, includes_number = false)
    return number if includes_number && palindrome?(number)


    build_palindrome(number)
  end

  private 

  def prepare(number)
    string = number.to_s
    mid = string.length / 2

    left = mid-1
    right = string.length.even? ? mid : mid+1 

    return string, mid, left, right
  end

  def build_palindrome(number)
    string, mid, left, right = prepare number

    # handle edge cases
    # 1. when everything is nines
    return "1#{"0" * (string.length - 1)}1".to_i if string =~ /^9+$/
    # 2. when its a single digit
    return number + 1 if number < 9 


    left_half = string[0..left].reverse.chars.map(&:to_i)
    right_half = string[right..string.length].chars.map(&:to_i)

    zip = left_half.zip(right_half)
    cutoff = 0

    zip.each do |left_digit, right_digit|
      if left_digit != right_digit
        break
      end
      cutoff += 1
    end

    result_half = ""
    result_mid = string.length.odd? ? string[mid] : ""

    is_palindrome = cutoff >= zip.length 
    need_add = is_palindrome || (zip[cutoff-1].first < zip[cutoff-1].second)

    if !need_add
      result_half = string[0..left].reverse
    else
      carry = 1

      if string.length.odd?
        mid_number = string[mid].to_i
        mid_number += 1
        carry = mid_number / 10
        mid_number %= 10
        result_mid = mid_number.to_s
      end

      left_half.each do |digit|
        digit += carry
        carry = digit / 10
        digit %= 10
        result_half += digit.to_s
      end
    end

    "#{result_half.reverse}#{result_mid}#{result_half}".to_i
  end
end
