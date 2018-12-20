//
//  ExampleObjectCellVM.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/6/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class ExampleObjectCellVM: RCViewModel {
    
    let content = Observable<String>("")
    
    private var model: TestAPIObject?
    var modelID: String!
    
    required init(model: TestAPIObject) {
        self.model = model
        
        content.next("Object content, \(model.description)")
    }
}

