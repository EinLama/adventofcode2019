
def doubles(str)
  doubles = []

  prev_c = nil
  str.each_char do |c|
    doubles << c if prev_c && c == prev_c
    prev_c = c
  end

  doubles
end

def valid_password?(password)
  return false unless password.length == 6
  return false if doubles(password).empty?

  prev_c = nil
  password.each_char do |c|
    c = c.to_i

    return false if prev_c && c < prev_c
    prev_c = c
  end

  true
end

def range()
  158126..624574
end

def solution()
  range().count { |password|
    valid_password?(password.to_s)
  }
end

if __FILE__ == $0
  puts solution()
end
