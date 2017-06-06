//: Playground - noun: a place where people can play

import UIKit


// 1.如果什么模式都不采用，需要在calculate方法中，编写大量代码。
// 2.此处算法未封装，向外暴露过多细节，不安全。
// 3.如果其它地方需要该算法，无法移植。
enum MovieTicketType {
    case children
    case vip
    case student
}

class MovieTicket {
    
    private var price = 0.0
    private var type: MovieTicketType!
    
    init(_ originalPrice: Double, _ movieTicketType: MovieTicketType) {
        self.price = originalPrice
        self.type = movieTicketType
    }
    
    func calculate() -> Double {
        switch type! {
        case .children where price > 20:
            print("一系列算法，经过大量计算---")
            return price - 10.0
        case .vip:
            print("一系列算法，经过大量计算---")
            print("vip用户积分+1")
            return price * 0.5
        case .student:
            print("一系列算法，经过大量计算---")
            return price * 0.8
        default:
            return 0
        }
    }
}

let mt = MovieTicket(60.0, .student)
print("打折后，学生电影票价格为:\(mt.calculate())")
