
#1 given
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

#5 complete
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#6 complete
def increase_pets_sold(pet_shop, num)
  return pet_shop[:admin][:pets_sold] += num
end

#7 complete
def stock_count(pet_shop)
  return pet_shop[:pets].length
end

#8 + 9 complete
def pets_by_breed(pet_shop, pet_breed)
  breed_total = []
  for pets in pet_shop[:pets]
    if pets[:breed] == pet_breed
      breed_total.push(pets)
  end
end
return breed_total
end

#10 + 11 complete
def find_pet_by_name(pet_shop, pet_name)
  for pets in pet_shop[:pets]
    if pets[:name] == pet_name
      return pets
    end
  end
    return nil
end

# #12 complete
def remove_pet_by_name(pet_shop, pet_name)
  remove_pet = find_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(remove_pet)
end

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

# Opt 01 + Opt 02 complete
def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] >= new_pet[:price]
    return true
  elsif customers[:cash] <= new_pet[:price]
   return false
 end
end


# # Opt 03 ATTEMPT!
# def sell_pet_to_customer_found(pet_shop, pet, customers)
#   pet_to_sell = find_pet_by_name(pet_shop, pet)
#   new_pet = pet_to_sell
#   pet_count = customer_pet_count(customers)
#     if pet_to_sell == pet
#       pet_shop.add_pet_to_customer(new_pet)
#       return pet_count
#     end
#
# end
