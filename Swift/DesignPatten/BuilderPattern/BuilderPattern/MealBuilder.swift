//
//  MealBuilder.swift
//  BuilderPattern
//
//  Created by 江连松 on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class MealBuilder: NSObject {

    func prepareVegMeal() -> Meal {
        let meal = Meal()
        meal.append(item: VerBurger())
        meal.append(item: Pepsi())
        return meal
    }
    
    func prepareNonVegMeal() -> Meal {
        let meal = Meal()
        meal.append(item: ChickenBurger())
        meal.append(item: Coke())
        return meal
    }
}
