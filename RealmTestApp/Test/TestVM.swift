//
//  TestVM.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/5/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class TestVM: NSObject {
    var vms = MutableObservableArray<ExampleObjectCellVM>()
    
    override init() {
        super.init()
        LLTestService.shared.getObjects()
            .observeNext { [weak self] objects in
                guard let sself = self else { return }
                sself.vms.replace(with: objects.map { ExampleObjectCellVM(model: $0) })
            }
            .dispose(in: self.bag)
    }
}

