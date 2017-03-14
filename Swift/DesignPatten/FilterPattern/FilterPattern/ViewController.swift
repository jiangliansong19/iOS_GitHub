//
//  ViewController.swift
//  FilterPattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 过滤器模式：一组对象，每个对象代表一个过滤规则，可以以解耦的方式组合起来，共同处理被过滤对象。组合顺序可以随意改变。
 责任链模式：也可以以解耦的方式结合起来，依次处理被过滤对象。每一个对象的next固定了，有顺序。
 */





class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        test1()
//        testNormal()

//        testFilterPattern()
        
        testFilterChain()
    }
    
    
    func test1() {
        
        func printPersons(persons: Array<Person>?) {
            if persons == nil {
                return
            }
            
            for obj in persons! {
                print("name:\(obj.name)\ngender:\(obj.gender)\nmaterial:\(obj.maritalStatus)")
            }
        }
        
        var persons = [Person]()
        
        persons.append(Person("江军", "Male", "Single"))
        persons.append(Person("江如", "FeMale", "Married"))
        persons.append(Person("江桦", "FeMale", "Married"))
        persons.append(Person("江山", "Male", "Married"))
        persons.append(Person("江筠筠", "FeMale", "Single"))
        persons.append(Person("江斯", "Male", "Single"))
        
        //过滤男性
        let male = CriteriaMale()
        print("\nMale:")
        printPersons(persons: male.meetCriteria(persons))
        
        //过滤女性
        let female = CriteriaFemale()
        print("\nFemal")
        printPersons(persons: female.meetCriteria(persons))
        
        //过滤单身
        let single = CriteriaSingle()
        print("\nSingle")
        printPersons(persons: single.meetCriteria(persons))
        
        //过滤女性单身
        let femaleAndSingle = AndCriteria()
        femaleAndSingle.firstCriteria = CriteriaFemale()
        femaleAndSingle.secondCriteria = CriteriaSingle()
        print("\nFemaleAndSingle")
        printPersons(persons: femaleAndSingle.meetCriteria(persons))
        
        //过滤男性或者单身
        let maleOrMarried = OrCriteria()
        maleOrMarried.firstCriteria = CriteriaMale()
        maleOrMarried.secondCriteria = CriteriaSingle()
        print("\nMaleOrSignle")
        printPersons(persons: maleOrMarried.meetCriteria(persons));
        
    }
    
    //未使用设计模式的过滤
    func testNormal() {

        let news = "3月5日下午，习近平代表中国共产党参加十二届全国军事演习。演习中，他亲切的接见了韩国总统朴槿惠，会谈了许久。惹得美日大骂：你妈！！"
        let normalHandler = NormalMsgHandler(news)
        let filterNews = normalHandler.filter()
        print(filterNews)
        
        //3月5日下午，**代表**参加十二届全国军事演习。演习中，他亲切的接见了韩国总统**，会谈了许久
        
    }
    
    //过滤器模式
    func testFilterPattern() {
        
        let news = "3月5日下午，习近平代表中国共产党参加十二届全国军事演习。演习中，他亲切的接见了韩国总统朴槿惠，会谈了许久。惹得美日大骂：你妈！！"
        let filterHandler = FilterMsgHandler(news, [CurseWordFilter()])
        let filterNews = filterHandler.doFilters()
        print(filterNews)
        
    }
    
    func testFilterChain() {
        
        let news = "3月5日下午，习近平代表中国共产党参加十二届全国军事演习。演习中，他亲切的接见了韩国总统朴槿惠，会谈了许久。惹得美日大骂：你妈！！"
        let filterChain = FilterChain(news)
        filterChain.addFilters(SenstiveFilter())
        filterChain.addFilters(PolicyNameFilter())
        let filterNews = filterChain.doFilters()
        print(filterNews)
    }
    
}

