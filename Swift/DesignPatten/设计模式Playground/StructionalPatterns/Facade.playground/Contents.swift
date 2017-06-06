//: Playground - noun: a place where people can play

import UIKit

//1.为子系统的一组接口，提供一个一致的界面，它定义了一个高层接口，使得子系统使用起来更加方便。
//2.隐藏子系统的复杂性，使用不需要理会子系统内部实现，只用最高层的接口即可。
//2.在子系统之上，再次封装，避免对子系统复杂对象的使用，减少了系统之间互相依赖，提高了安全性。


protocol Restaurant {
    func assistByWaiter()
}

class KFC: Restaurant {
    func assistByWaiter() {
        //此处几十位厨师开始忙了5分钟。
        print("在服务员的帮助下点单，然后你吃了2个老北京鸡肉卷。");
    }
}

class BurgerKing: Restaurant {
    func assistByWaiter() {
        //各种工艺，各种做饭，你都不用管
        print("在服务员的帮助下点单，然后你吃了1个超级墨西哥加厚汉堡。");
    }
}

class PizzaHut: Restaurant {
    func assistByWaiter() {
        //厨房外人莫入，字需要在前台付钱，拿披萨就行了。
        print("在服务员的帮助下点单，然后你吃了1块披萨。");
    }
}

KFC().assistByWaiter()
BurgerKing().assistByWaiter()
PizzaHut().assistByWaiter()
