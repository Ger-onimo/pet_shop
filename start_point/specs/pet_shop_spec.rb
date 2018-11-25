require 'minitest/autorun'
require_relative '../pet_shop'

class TestPetShop < Minitest::Test

  def setup

    @customers = [
      {name: "Craig", pets: [], cash: 1000},
      {name: "Zsolt", pets: [], cash: 50 }
      ]

    @new_pet = {name: "Bors the Younger", pet_type: :cat, breed: "Cornish Rex", price: 100 }

    @pet_shop = {
        pets: [
          {name: "Sir Percy", pet_type: :cat, breed: "British Shorthair", price: 500 },
          {name: "King Bagdemagus", pet_type: :cat, breed: "British Shorthair", price: 500 },
          {name: "Sir Lancelot", pet_type: :dog, breed: "Pomsky", price: 1000 },
          {name: "Arthur", pet_type: :dog, breed: "Husky", price: 900 },
          {name: "Tristan", pet_type: :dog, breed: "Basset Hound",price: 800 },
          {name: "Merlin", pet_type: :cat, breed: "Egyptian Mau", price: 1500 }
            ],
        admin: {total_cash: 1000, pets_sold: 0,},
        name: "Camelot of Pets"
      }
  end
#1 given
  def test_pet_shop_name
    name = pet_shop_name(@pet_shop)
    assert_equal("Camelot of Pets", name)
  end

#2 complete
  def test_total_cash
    sum = total_cash(@pet_shop)
    assert_equal(1000, sum)
  end

#3 complete
  def test_add_or_remove_cash__add
    add_or_remove_cash_add(@pet_shop,10)
    cash = total_cash(@pet_shop) #expected
    assert_equal(1010, cash)
  end

#4 complete TODO
  def test_add_or_remove_cash__remove
    add_or_remove_cash_remove(@pet_shop,-10)
    cash = total_cash(@pet_shop)
    assert_equal(990, cash)
  end

#5 complete
  def test_pets_sold
    sold = pets_sold(@pet_shop)
    assert_equal(0, sold)
  end

#6 complete
  def test_increase_pets_sold
    increase_pets_sold(@pet_shop,2)
    sold = pets_sold(@pet_shop)
    assert_equal(2, sold)
  end

#7 complete
  def test_stock_count
    count = stock_count(@pet_shop)
    assert_equal(6, count)
  end

#8 complete REFACTOR
  def test_all_pets_by_breed__found
    pets = pets_by_breed(@pet_shop, "British Shorthair")
    assert_equal(2, pets.count) #REMOVE MY NOTE: .count is a check within the test - see friends
  end

#9 completed - defined by #8
  def test_all_pets_by_breed__not_found
    pets = pets_by_breed(@pet_shop, "Dalmation")
    assert_equal(0, pets.count)
  end

#10 complete REFACTOR
  def test_find_pet_by_name__returns_pet
    # added _1 to define individual function took out the _1 when refactored
    pet = find_pet_by_name(@pet_shop, "Arthur")
    assert_equal("Arthur", pet[:name])
  end

# #11 complete REFACTOR so 10 and 11 define in same method
#   def test_find_pet_by_name__returns_nil
#     # added _nil to define individual function took out the _nil when refactored
#     pet = find_pet_by_name(@pet_shop, "Fred")
#     assert_nil(pet)
#   end

#12 ****WORKING ON******
  # def test_remove_pet_by_name
  #   remove_pet_by_name(@pet_shop, "Arthur")
  #   pet = find_pet_by_name(@pet_shop,"Arthur")
  #   assert_nil(pet)
  # end

#13 complete
  def test_add_pet_to_stock
    add_pet_to_stock(@pet_shop, @new_pet)
    count = stock_count(@pet_shop)
    assert_equal(7, count)
  end

#14 complete
  def test_customer_cash
    cash = customer_cash(@customers[0])
    assert_equal(1000, cash)
  end

#15 complete
  def test_remove_customer_cash
    customer = @customers[0]
    remove_customer_cash(customer, 100)
    assert_equal(900, customer[:cash])
  end

#16 complete
  def test_customer_pet_count
    count = customer_pet_count(@customers[0])
    assert_equal(0, count)
  end

#17 complete
  def test_add_pet_to_customer
    customer = @customers[0]
    add_pet_to_customer(customer, @new_pet)
    assert_equal(1, customer_pet_count(customer))
  end

# OPTIONAL
# Opt 01
  def test_customer_can_afford_pet__insufficient_funds
    customer = @customers[1]
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)
    assert_equal(false, can_buy_pet)
  end

# Opt 02
  def test_customer_can_afford_pet__sufficient_funds
    customer = @customers[0]
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)
    assert_equal(true, can_buy_pet)
  end

# Opt 03
  #These are 'integration' tests so we want multiple asserts.
  #If one fails the entire test should fail
  def test_sell_pet_to_customer__pet_found
    customer = @customers[0]
    pet = find_pet_by_name(@pet_shop,"Arthur")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(1, customer_pet_count(customer))
    assert_equal(1, pets_sold(@pet_shop))
    assert_equal(100, customer_cash(customer))
    assert_equal(1900, total_cash(@pet_shop))
  end

# Opt 04

  # def test_sell_pet_to_customer__pet_not_found
  #   customer = @customers[0]
  #   pet = find_pet_by_name(@pet_shop,"Dave")

  #   sell_pet_to_customer(@pet_shop, pet, customer)

  #   assert_equal(0, customer_pet_count(customer))
  #   assert_equal(0, pets_sold(@pet_shop))
  #   assert_equal(1000, customer_cash(customer))
  #   assert_equal(1000, total_cash(@pet_shop))
  # end

# Opt 05

  # def test_sell_pet_to_customer__insufficient_funds
  #   customer = @customers[1]
  #   pet = find_pet_by_name(@pet_shop,"Arthur")

  #   sell_pet_to_customer(@pet_shop, pet, customer)

  #   assert_equal(0, customer_pet_count(customer))
  #   assert_equal(0, pets_sold(@pet_shop))
  #   assert_equal(1000, customer_cash(@pet_shop))
  #   assert_equal(1000, total_cash(@pet_shop))
  # end

end
