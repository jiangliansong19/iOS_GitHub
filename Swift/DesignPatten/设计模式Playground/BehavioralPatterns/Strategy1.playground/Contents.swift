//: Playground - noun: a place where people can play

import UIKit

enum MovieTicketType: String {
    case ChildDiscount
    case StudentDiscount
    case VipDiscount
}

class Discount: AnyObject {
    func calculate(price: Double) -> Double{return 0}
    static func getDiscount(_ type: MovieTicketType) -> Discount {
        switch type {
        case .ChildDiscount:
            return ChildDiscount()
        case .StudentDiscount:
            return StudentDiscount()
        case .VipDiscount:
            return VipDiscount();
        }
    }
    required init(){}
}


class StudentDiscount: Discount {
    override func calculate(price: Double) -> Double {
        print("一系列算法，经过大量运算---")
        return price * 0.8
    }
}
class ChildDiscount: Discount {
    override func calculate(price: Double) -> Double {
        print("一系列算法，经过大量运算---")
        return price - 10.0
    }
}
class VipDiscount: Discount {
    override func calculate(price: Double) -> Double {
        print("一系列算法，经过大量运算---")
        print("用户积分+1")
        return price * 0.5
    }
}

class MovieTicket {
    private var price: Double = 0.0
    private var type: MovieTicketType!
    
    init(_ originalPrice: Double, _ movieTicketType: MovieTicketType) {
        self.price = originalPrice
        self.type = movieTicketType
    }
    
    func getCalculatePrice() -> Double {
        let discount = Discount.getDiscount(type)
        return discount.calculate(price: price)
    }
}

let mt = MovieTicket(60.00, .ChildDiscount)
print("儿童电影票价格:\(mt.getCalculatePrice())")
