require_relative './person.rb'

class Bank
attr_reader :bank_name,
            :open_account,
            :name,
            :deposit_amount,
            :balance,
            :total_cash

  def initialize(bank_name)
    puts "#{bank_name} has been created."
    @bank_name = bank_name
    @balance = 0
  end

  def open_account(person)
    @name = person.name
    person.bank_accounts << bank_name
    puts "An account has been opened for #{name} with #{bank_name}."
  end

  def deposit(person, deposit_amount)
    if person.amount < deposit_amount
      puts "#{name} doesn't have enough cash to perform this deposit"
    else
      @balance += deposit_amount
      @total_cash = person.amount - deposit_amount
      puts "#{name} has deposited #{deposit_amount}. Balance: #{balance}"
    end
  end

  def withdrawl(person, withdrawl_amount)
    if withdrawl_amount > @balance
      puts "Insufficient funds."
    else
      @balance -= withdrawl_amount
      @total_cash += withdrawl_amount
      puts "#{name} has withdrawn #{withdrawl_amount} galleons. Balance: #{balance}"
    end
  end

  def transfer(person, transfer_bank_name, transfer_amount)
    if transfer_amount > @balance
      puts "Insufficient funds."
    elsif person.bank_accounts.include?(transfer_bank_name) && transfer_amount <= @balance
      @balance -= transfer_amount
      puts "#{name} has transferred #{transfer_amount} galleons from #{bank_name} to #{transfer_bank_name}."
    else
      puts "#{name} does not have an account with #{transfer_bank_name}."
    end
  end
end

chase = Bank.new("JP Morgan Chase")
person_1 = Person.new("Jasmin", 1000)
chase.open_account(person_1)
chase.deposit(person_1, 200)
puts person_1.amount
puts chase.total_cash
chase.withdrawl(person_1, 50)
puts chase.total_cash
chase.withdrawl(person_1, 5000)

wells_fargo = Bank.new("Wells Fargo")
wells_fargo.open_account(person_1)
puts person_1.bank_accounts.inspect
transfer_bank_name = "Wells Fargo"
chase.transfer(person_1, transfer_bank_name, 100)
