//
//  Criteria.swift
//  FilterPattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol Criteria {
    func meetCriteria(_ array: Array<Person>) -> Array<Person>?
}


class CriteriaMale: Criteria {
    
    func meetCriteria(_ array: Array<Person>) -> Array<Person>? {
        return array.filter{$0.gender.lowercased() == "male"}
    }
}


class CriteriaFemale: Criteria {
    
    func meetCriteria(_ array: Array<Person>) -> Array<Person>? {
        return array.filter{$0.gender.lowercased() == "female"}
    }
}


class CriteriaSingle: Criteria {
    
    func meetCriteria(_ array: Array<Person>) -> Array<Person>? {
        return array.filter{$0.maritalStatus.lowercased() == "single"}
    }
}


class AndCriteria: Criteria {
    
    var firstCriteria: Criteria?
    var secondCriteria: Criteria?
    
    func meetCriteria(_ array: Array<Person>) -> Array<Person>? {
        let first = firstCriteria?.meetCriteria(array)
        return secondCriteria?.meetCriteria(first ?? [])
    }
}

class OrCriteria: Criteria {
    
    var firstCriteria: Criteria?
    var secondCriteria: Criteria?
    
    func meetCriteria(_ array: Array<Person>) -> Array<Person>? {
        let first = firstCriteria?.meetCriteria(array)
        var second = secondCriteria?.meetCriteria(array)
        
        for obj in first! {
            if first?.contains(obj) == false {
                second?.append(obj)
            }
        }
        return second
    }
}
