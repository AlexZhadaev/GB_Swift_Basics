//Для наследников сделал разные варианты overrid'a методов, не знаю какой из них ближе к тому, что подразумевалось в задании. Изначально хотел сделать один большой метод со Switch в родителе и в наследниках переопределять только нужные кейсы, примерно так:
//override func controlActions (launch: Actions) {
//    super.controlActions(launch: .winchOn)
//    self.winch = .winchOn
//    super.controlActions(launch: .winchOff)
//    self.winch = .winchOff
//}
//Однако столкнулся с тем, что при такой записи работает только последний кейс, в итоге не нашел информацию, можно ли так переопределить несколько кейсов.

import Foundation

enum Actions {
    case windowsOpen, windowsClose, winchOn, winchOff
}

enum NitroActions {
    case nitroOn, nitroOff
}

class Car {
    let model: String
    var windows: Actions

    init (model: String, windows: Actions) {
        self.model = model
        self.windows = windows
    }
    
    func controlActions (launch: Actions) {
        switch launch {
        case .windowsOpen:
            self.windows = .windowsOpen
        case .windowsClose:
            self.windows = .windowsClose
        case .winchOn:
            break
        case .winchOff:
            break
        }
    }
    
    func goNitro() {
        print("Nitro is not here")
    }
    func stopNitro() {
        print("And here")
    }
}

class SportCar: Car {
    var nitro: NitroActions
    
    init (model: String, windows: Actions, nitro: NitroActions) {
        self.nitro = nitro
        super.init (model: model, windows: windows)
    }
    
    override func controlActions (launch: Actions) {
        super.controlActions(launch: .windowsOpen)
        self.windows = .windowsClose
        print("Only close, it's Nascar")
    }
    
    override func goNitro() {
        self.nitro = .nitroOn
    }
    
    override func stopNitro() {
        self.nitro = .nitroOff
    }
}
 
class TrunkCar: Car {
    var winch: Actions
    
    init (model: String, windows: Actions, winch: Actions) {
        self.winch = winch
        super.init (model: model, windows: windows)
    }
    
    override func controlActions (launch: Actions) {
        switch launch {
        case .windowsOpen:
            self.windows = .windowsOpen
        case .windowsClose:
            self.windows = .windowsClose
        case .winchOn:
            self.winch = .winchOn
        case .winchOff:
            self.winch = .winchOff
        }
    }
    
}
 
 
var mudRunner = TrunkCar(model: "Kamaz", windows: .windowsClose, winch: .winchOff)

var nascarCar = SportCar(model: "Ford", windows: .windowsClose, nitro: .nitroOff)

print(mudRunner.model,"/", mudRunner.winch)
mudRunner.controlActions(launch: .winchOn)
print(mudRunner.winch)
mudRunner.controlActions(launch: .winchOff)
print(mudRunner.winch)

print(nascarCar.model,"/", nascarCar.nitro)
nascarCar.controlActions(launch: .windowsOpen)
print(nascarCar.windows)
nascarCar.goNitro()
print(nascarCar.nitro)
