import UIKit

struct Currency {
    var price: Float
}

enum EchangeError: Error {
    case invalidSelection
    case negativeMeaning
}

class BuyingCurrency {
    var currency = [
        "eur": Currency(price: 89),
        "dollar": Currency(price: 71)
    ]
    
    func setExchangeRate(itemCurrency name: String, _ cost: Float ) throws {
        
        guard currency[name] != nil else {
            throw EchangeError.invalidSelection
        }
        
        guard cost > 0 else {
            throw EchangeError.negativeMeaning
        }
        
        self.currency[name]!.price = cost
        
    }
    
    func echange(itemCurrency name: String, _ count: Float ) throws -> Float {
        
        guard let item = currency[name] else {
            throw EchangeError.invalidSelection
        }
        
        guard count > 0 else {
            throw EchangeError.negativeMeaning
        }
        
        return Float(item.price) * count

    }
}

var echange = BuyingCurrency()
do {
    try echange.setExchangeRate(itemCurrency: "dollar", 1.0)
    try echange.echange(itemCurrency: "dollar", 15.2)
} catch EchangeError.invalidSelection {
    print("Не верно выбрана валюта")
} catch EchangeError.negativeMeaning {
    print("Не верная сумма для обмена")
}


