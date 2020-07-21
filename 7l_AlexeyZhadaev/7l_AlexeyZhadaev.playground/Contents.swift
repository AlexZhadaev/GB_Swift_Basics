import Cocoa

enum DishServingError: Error {
    case wrongDish
    case outOfStock
    case insufficientMoney(moneyNeeded: Int)
}

struct Food {
    let name: String
}

struct Item {
    let product: Food
    var count: Int
    var price: Int
}

class FoodDelivery {
    var menu = [
    "Burger": Item(product: Food(name: "Burger"), count: 20, price: 8),
    "Pizza": Item(product: Food(name: "Pizza"), count: 15, price: 10),
    "Lasagna": Item(product: Food(name: "Lasagna"), count: 0, price: 12)
    ]
    
    var deposite = 8
    
    func sell(dish name: String) -> (Food?, DishServingError?) {
            guard let dish = menu[name] else {
                return (nil, DishServingError.wrongDish)
            }
            guard dish.count > 0 else {
                return (nil, DishServingError.outOfStock)
            }
            guard dish.price <= deposite else {
                return (nil, DishServingError.insufficientMoney(moneyNeeded: dish.price - deposite))
            }
            deposite -= dish.price
            var soldDish = dish
            soldDish.count -= 1
            menu[name] = soldDish
        return (soldDish.product, nil)
        }
    }

struct Dish {
    let product: Food
    var count: Int
}

class DishServing {
    var menu = [
        "Hamburger": Dish(product: Food(name: "Hamburger"), count: 7),
        "Pizza": Dish(product: Food(name: "Pizza"), count: 7),
        "Lasagna": Dish(product: Food(name: "Lasagna"), count: 0),
    ]

    func dish(itemNamed name: String) throws -> Food {
        guard let item = menu[name] else {
            throw DishServingError.wrongDish
        }
        guard item.count > 0 else {
            throw DishServingError.outOfStock
        }
        var newItem = item
        newItem.count -= 1
        menu[name] = newItem
        return newItem.product
    }
}

let foodDelivery = FoodDelivery()
let sell1 = foodDelivery.sell(dish: "Burger")
let sell2 = foodDelivery.sell(dish: "Pizza")
if let product = sell1.0 {
    print("Мы купили: \(product.name)")
} else if let error = sell1.1 {
    print("Произошла ошибка: \(error)")
}
if let product = sell2.0 {
    print("Мы купили: \(product.name)")
} else if let error = sell2.1 {
    print("Произошла ошибка: \(error)")
}

let sell3 = DishServing()
let sell4 = DishServing()
do {
    _ = try sell3.dish(itemNamed: "Lasagna")
} catch DishServingError.outOfStock {
    print("Блюда нет в наличии")
} catch let error {
    print(error)
}
do {
    _ = try sell4.dish(itemNamed: "CrabsBurger")
} catch DishServingError.outOfStock {
    print("Блюда нет в наличии")
} catch let error {
    print("Произошла ошибка: \(error)")
}
