
#1 complete
def pet_shop_name(name)
  return name[:name]
end

#2 complete
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

# 3 complete
def add_or_remove_cash_add(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

#4 complete
def add_or_remove_cash_remove(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

#5
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#6
def increase_pets_sold(pet_shop, num)
  return pet_shop[:admin][:pets_sold] += num
end

#7
def stock_count(pet_shop)
  return pet_shop[:pets].length
end

#8 + 9 complete review this to figure out what is going on!!!!!!
def pets_by_breed(pet_shop, pet_breed)
  breed_total = []
  for pets in pet_shop[:pets]
    if pets[:breed] == pet_breed
      breed_total.push(pets)
  end
end
return breed_total
end

#10 complete, BUT REFACTOR with #11
def find_pet_by_name(pet_shop, pet_name)
  for pets in pet_shop[:pets]
    if pets[:name] == pet_name
      return pets
    end
  end
    return nil
end

#11 complete BUT REFACTOR with #10
# def find_pet_by_name_nil(pet_shop, pet_name)
#   for pets in pet_shop[:pets]
#     if pets[:name] != pet_name
#       return nil
#     end
#   end
# end

#12 ****WORKING ON******
# def remove_pet_by_name(pet_shop, pet_name)
#   pets_array_index = 0
#   for pets_hash in pet_shop[:pets]
#     if pets[:name] == pet_name
#       end
#   end
# end

# def test_remove_pet_by_name
#   remove_pet_by_name(@pet_shop, "Arthur")
#   pet = find_pet_by_name(@pet_shop,"Arthur")
#   assert_nil(pet)
# end

#13 complete
def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

#14 complete
def customer_cash(customers)
  return customers[:cash]
end

#15 complete
def remove_customer_cash(customers, amount)
  return customers[:cash] -= amount
end

#16 complete
def customer_pet_count(customers)
  return customers[:pets].count
end

#17 complete
def add_pet_to_customer(customers, new_pet)
  customers[:pets].push(new_pet)
end

# OPTIONAL

# Opt 01 complete BUT REFACTOR with Opt 02
def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] >= new_pet[:price]
    return true
  elsif customers[:cash] <= new_pet[:price]
   return false
 end
end

# Opt 02 complete BUT REFACTOR with 01
# def customer_can_afford_pet(customers, new_pet)
#   if customers[:cash] <= new_pet[:price]
#     return true
#   end
#   return false
# end

# Opt 03
def sell_pet_to_customer(pet_shop, pet, customers)
  if

  end

end

# #These are 'integration' tests so we want multiple asserts.
# #If one fails the entire test should fail
# def test_sell_pet_to_customer__pet_found
#   customer = @customers[0]
#   pet = find_pet_by_name(@pet_shop,"Arthur")
#
#   sell_pet_to_customer(@pet_shop, pet, customer)
#
#   assert_equal(1, customer_pet_count(customer))
#   assert_equal(1, pets_sold(@pet_shop))
#   assert_equal(100, customer_cash(customer))
#   assert_equal(1900, total_cash(@pet_shop))
# end

# @customers = [
#   {name: "Craig", pets: [], cash: 1000},
#   {name: "Zsolt", pets: [], cash: 50 }
#   ]
#
# @new_pet = {name: "Bors the Younger", pet_type: :cat, breed: "Cornish Rex", price: 100 }
#
# @pet_shop = {
#     pets: [
#       {name: "Sir Percy", pet_type: :cat, breed: "British Shorthair", price: 500 },
#       {name: "King Bagdemagus", pet_type: :cat, breed: "British Shorthair", price: 500 },
#       {name: "Sir Lancelot", pet_type: :dog, breed: "Pomsky", price: 1000 },
#       {name: "Arthur", pet_type: :dog, breed: "Husky", price: 900 },
#       {name: "Tristan", pet_type: :dog, breed: "Basset Hound",price: 800 },
#       {name: "Merlin", pet_type: :cat, breed: "Egyptian Mau", price: 1500 }
#         ],
#     admin: {total_cash: 1000, pets_sold: 0,},
#     name: "Camelot of Pets"
#   }
