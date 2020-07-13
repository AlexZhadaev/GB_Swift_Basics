
import Cocoa

protocol Car {
    var model: String { get }
    func beepBeep() -> String
}

extension Car {
    func engineOn() {
        print("Engine is running")
    }
}

extension Car {
    func engineOff() {
        print("Engine shut off")
    }
}

class TrunkCar: Car {
    var model: String
    var cistern: Bool
    func beepBeep() -> String {
        return ("Beep-Beep!")
    }
    init(model: String, cistern: Bool) {
        self.model = model
        self.cistern = cistern
    }
}

class SportCar: Car {
    var model: String
    var turbine: Bool
    func beepBeep() -> String {
        return ("Boop!")
    }
    init(model: String, turbine: Bool) {
        self.model = model
        self.turbine = turbine
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return String(describing: turbine)
    }
    
    func printDescription() {
        print("Turbine is enough?", description)
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return String(describing: model)
    }
    
    func printDescription() {
        print("Brand of truck:", description)
    }
}

var car1 = TrunkCar(model:"Daf", cistern: true)
var car2 = SportCar(model:"Subaru", turbine: true)
car1.printDescription()
car1.engineOn()
car2.printDescription()
car2.engineOff()
print(car2.model)
print(car1.cistern)

