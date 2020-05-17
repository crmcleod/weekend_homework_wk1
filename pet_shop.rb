def pet_shop_name (pet_shop)
    return pet_shop[:name]
end

def total_cash (pet_shop)
    return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash (pet_shop, cash)
    pet_shop[:admin][:total_cash] += cash
end

def pets_sold (pet_shop)
   return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
    pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count (pet_shop)
    return pet_shop[:pets].length
end

def pets_by_breed (pet_shop, breed_to_find)
    pets = pet_shop[:pets]
    pet_breed = []
    for pet in pets
        pet_breed <<  pet[:breed] if pet[:breed] == breed_to_find
    end
    return pet_breed
end 

def find_pet_by_name (pet_shop, pet_by_name)
   pets = pet_shop[:pets]
   for pet in pets
        if pet_by_name == pet[:name]
            return pet
        end
    end
    return nil
end

def remove_pet_by_name (pet_shop, pet_by_name)
    pets = pet_shop[:pets]
    for pet in pets
        if pet_by_name == pet[:name]
            pets.delete(pet)
        end
    end
end

def add_pet_to_stock (pet_shop, new_pet)
    pet_shop[:pets].push(new_pet)
end

def customer_cash (customer)
    return customer[:cash]
end

def remove_customer_cash (customer, cash)
    customer[:cash] -= cash
end

def customer_pet_count (customer)
    return customer[:pets].count
end

def add_pet_to_customer (customer, new_pet)
    customer[:pets].push(new_pet)
end

def customer_can_afford_pet (customer, new_pet)
    return customer[:cash] >= new_pet[:price]
end


# this needs refactored
def sell_pet_to_customer (pet_shop, pet, customer)
    add_pet_to_customer(customer, pet)
    pet_shop[:admin][:pets_sold] += customer[:pets].count
    pet_price = pet[:price]
    remove_customer_cash(customer, pet_price )
    add_or_remove_cash(pet_shop, pet_price)
end
        