class Address

  attr_accessor :street, :city, :state, :zipcode

  def initialize
    street = city = state = zipcode = ''
  end
end