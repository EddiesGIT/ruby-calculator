#   operation_selection = gets "Type 1 to add, 2 to subtract, 3 to multiply, or 4 to divide two numbers: "
#  if operation_selection == 1 
#     return "add"
#   elsif operation_selection == 2
#     return "subtract"
#   elsif operation_selection == 3
#     return "multiply"
#   elsif operation_selection == 4
#     return "divide"
#   else return "error"
#   end

# puts "Type 1 to add, 2 to subtract, 3 to multiply, or 4 to divide two numbers: "
#   operation_selection = gets.to_i
#  if operator == "add"
#     return result= a + b
#   elsif operator == "subtract"
#     return result = a - b
#   elsif operator == "multiply"
#     return result = a * b
#   elsif operator == "divide"
#     return result = a / b

# end

def is_number? expr
  return false if expr.nil?
  expr = "#{expr}"              # we need this condition in case the expr is a number
  expr.match /^(\d+|\d+\.\d+)$/ # since match() is defined only for strings
end

def calc(expr)  
  return expr.to_i if is_number? expr
  expr.gsub!(" ","") # clean the string from whitespaces
  # pay attention to the order: + and - should come before * and /
  # can you figure out why ?
  arr = expr.split /\+/
  return arr.inject(0){|x,y| calc(x) + calc(y) } if arr.size > 1
  arr = expr.split /\-/  
  return arr.inject(0){|x,y| calc(x) - calc(y) } if arr.size > 1
  arr = expr.split /\*/
  return arr.inject(1){|x,y| calc(x) * calc(y) } if arr.size > 1
  arr = expr.split /\//
  return arr.inject   {|x,y| calc(x) / calc(y) } if arr.size > 1
end

puts calc("5+5* 6+4/2.0")
#output 37