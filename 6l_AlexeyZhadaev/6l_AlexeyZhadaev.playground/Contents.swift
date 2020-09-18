import Cocoa

protocol Aged {
    var age: Int { get set }
}
class Human: Aged {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Human: CustomStringConvertible {
    var description: String {
        return String(describing: name)
    }
    
    func printDescription() {
        print(description)
    }
}

struct Queue<T: Aged> {
    private var elements: [T] = []
    
//    func filter<T: Aged>(list: [T], key: Int) -> [T] {
//        return list.filter { $0.age == key}
//    }
//это должна была быть сортировка с помощью Filter, но не вышло
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    
    var totalAge : Int {
        var age = 0
        for element in elements {
            age += element.age
        }
        return age
    }
    
    subscript(elements: Int ...) -> Int? {
        var averageAge = 0
        var count = 0
        
        for index in elements {
            if index < self.elements.count {
                averageAge += self.elements[index].age
                count += 1
            } else {
                print("Index out of range")
                return nil
            }
        }
        averageAge = averageAge / count
        print("Average age in queue - \(averageAge)")
        return averageAge
    }
}

var queue = Queue<Human>()
queue.push(Human(name: "D'Artagnan", age: 18))
queue.push(Human(name: "Ashot", age: 32))
queue.push(Human(name: "Zurab", age: 51))
queue.push(Human(name: "Khabib", age: 29))
queue.push(Human(name: "Surenjan", age: 67))
queue.push(Human(name: "Rafic", age: 19))
print(queue)
queue[0,1,5]
queue.pop()
print(queue)
queue[0,1,5]
