class Person
attr_reader :amount, :name, :bank_accounts

  def initialize(name, amount)
    puts "#{name} has been created with #{amount} galleons in cash."
    @amount = amount.to_i
    @bank_accounts = []
    @name = name
  end
end

person_1 = Person.new("Jasmin", 1000)
person_2 = Person.new("Chris", 2000)

puts person_1.amount
