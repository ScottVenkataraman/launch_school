=begin 
Build a mortgage or car payment calculator. 
  Given the following information:
    -the loan amount
    -the Annual Percentage Rate (APR)
    -the loan duration
  Return the monthly payment amount. 

  From the above, you'll need to calculate the following things:
  -monthly interest rate
  -loan duration in months
  -monthly payment

  You can calculate it using the following equation:
    -m = p * (j / (1 - (1 + j)**(-n)))
    -m = monthly payment
    -p = loan amount
    -j = monthly interest rate
    -n = loan duration in months

  Input: 2 integers and a float
    Loan Amount
    APR
    Loan Duration 
  
  Output: an integer (the monthly payment amount)

  Rules
    Express interest rate as a float
    Convert APR to a monthly interest rate
    Convert loan duration to months if given in years

  Data structures: 
    Integers, float

  Algorithm:
  LOOP
    GET the loan amount(integer)
    GET the loan duration(integer)
    GET the annual percentage rate(float)
      GET the apr as an integer, convert to a float
    HELPER: Convert loan duration from years to months and assign to a variable
    HELPER: Convert annual percentage rate to a monthly percentage rate and assign to a variable
    Calculate what the monthly payment will be using the above formula
    Return the monthly payment
  PRINT "Calculate again?"
  IF no
    BREAK
  END
=end 

def convert_loan_duration_to_months(duration_in_years)
  duration_in_months = duration_in_years * 12
  end
  
  def convert_apr_to_monthly_interest(apr)
  monthly_rate = apr / 12
  end
  
  def calculate_monthly_payment(loan_amount, loan_duration, apr)
  loan_in_months = convert_loan_duration_to_months(loan_duration)
  monthly_interest = convert_apr_to_monthly_interest(apr)
  
  monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_in_months)))
  puts "Your monthly payment is #{monthly_payment} / month."
  end

#begin loop 
loop do 
  loan_amount = 0
  loan_duration = 0
  apr = 0

  #GET loan amount 
  loop do
  puts "==> Please enter your loan amount in dollars:"
  loan_amount = gets.chomp.to_i
  if loan_amount > 0
    break
  else
    puts "Please enter a number greater than 0."
  end
  end

  #Get the loan duration
  loop do
    puts "==> Please enter your loan duration in years:"
    loan_duration = gets.chomp.to_i
    if loan_duration > 0
      break
    else 
      puts "Please enter a number greater than 0."
    end
    end

  #Get APR
  loop do
    puts "==> Please enter your annual percentage rate as a whole number, (if 5%, enter 5):"
    apr = gets.chomp.to_f
    if apr >= 0
      apr = apr / 100 
      break
    else
      puts "Please enter a number greater than or equal to 0."
    end
  end

  # loan amount = 1000, loan duration = 5 years, apr = 15 %
  calculate_monthly_payment(loan_amount, loan_duration, apr) # == 23.7899
puts "==> Would you like to calculate another loan? Y/N"
answer = gets.chomp.upcase
if answer == 'N'
  puts "Thank you, goodbye"
  break
end
end
  