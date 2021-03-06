require 'csv'

class Customer
  attr_reader :id
  attr_accessor :email, :address

  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  def self.all
    all_customers = []
    CSV.read('data/customers.csv').each do |customer|
      id = customer[0].to_i
      email = customer[1]
      address = {}
      address[:street] = customer[2]
      address[:city] = customer[3]
      address[:state] = customer[4]
      address[:zip] = customer[5]
      all_customers << Customer.new(id, email, address)
    end
    return all_customers
  end

  def self.find(id)
    Customer.all.each do |customer|
      if customer.id == id
        return customer
      end
    end
    return nil
  end

end