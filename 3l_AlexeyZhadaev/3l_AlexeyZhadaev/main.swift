//
import Foundation
//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия - так и не получилось заставить mutating func подтягивать аргументы enum и изменять с их помощью filledTrunk. Получалась какая-то каша - то Editor placeholder in source file, то еще что.

struct aCar {
    var brand: String
    let year: Int
    var trunkVolume: Int
    var engStat: EngineStatus
    var winStat: WindowStatus
    var filledTrunk: Int
    var trunkOper: TruckActions
}

struct carTruck {
    var brand: String
    let year: Int
    var trunkVolume: Int
    var engStat: EngineStatus
    var winStat: WindowStatus
    var filledTrunk: Int
    var trunkOper: TruckActions
    
}


//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum EngineStatus {
    case On, Off
}
enum WindowStatus {
    case Open, Close
}
enum TruckActions: Int {
case put = 100
case unload = 4900
}
//fakecomment

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var volga = aCar(brand: "Volga", year: 1999, trunkVolume: 500, engStat: .On, winStat: .Open, filledTrunk: 150, trunkOper: .put)

var kamaz = carTruck(brand: "Kamaz", year: 1983, trunkVolume: 23700, engStat: .Off, winStat: .Close, filledTrunk: 19000, trunkOper: .unload)

//6. Вывести значения свойств экземпляров в консоль.

print(kamaz.brand, kamaz.year, kamaz.trunkVolume, kamaz.filledTrunk)
print(volga.brand, volga.year, volga.trunkVolume, volga.filledTrunk)

