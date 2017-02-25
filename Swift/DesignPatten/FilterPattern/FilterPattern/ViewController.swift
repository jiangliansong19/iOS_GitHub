//
//  ViewController.swift
//  FilterPattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    
    func printPersons(persons: Array<Person>?) {
        
        if persons == nil {
            return
        }
        
        for obj in persons! {
            print("name:\(obj.name)\ngender:\(obj.gender)\nmaterial:\(obj.maritalStatus)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

