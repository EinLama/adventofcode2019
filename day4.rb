
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

  # Ensure order is ascending:
  return password.split("") == password.split("").sort
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
