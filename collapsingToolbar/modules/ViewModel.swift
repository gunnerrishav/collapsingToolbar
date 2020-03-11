//
//  ViewModel.swift
//  collapsingToolbar
//
//  Created by Rishab Maharjan on 2/12/20.
//  Copyright © 2020 Rishab. All rights reserved.
//

import Foundation

enum ListType: Int {
    case fruits, animals, vegetables
}

class ViewModel {
    let tabs: [ListType] = [.fruits, .animals, .vegetables]

    let fruits = ["Apple", "Banana", "Grapes", "Papaya", "Apple", "Banana", "Grapes", "Papaya", "Apple", "Banana", "Grapes", "Papaya"]
    let animals = ["Rabbit", "Monkey", "Bear", "Deer", "Rabbit", "Monkey", "Bear", "Deer", "Rabbit", "Monkey", "Bear", "Deer"]
    let vegetables = ["Carrot", "Potato", "Cucumber", "Spinach", "Carrot", "Potato", "Cucumber", "Spinach", "Carrot", "Potato", "Cucumber", "Spinach"]

    func numberOfTabs() -> Int {
        return self.tabs.count
    }

    func tab(at index: Int) -> ListType {
        return self.tabs[index]
    }

    func numberOfRows(for listType: ListType) -> Int {
        switch listType {
        case .fruits: return fruits.count
        case .animals: return animals.count
        case .vegetables: return vegetables.count
        }
    }

    func element(at index: Int, for listType: ListType) -> String? {
        switch listType {
        case .fruits: return fruits[index]
        case .animals: return animals[index]
        case .vegetables: return vegetables[index]
        }
    }
}
