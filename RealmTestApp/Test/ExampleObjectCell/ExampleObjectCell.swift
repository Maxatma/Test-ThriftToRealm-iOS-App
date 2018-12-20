//
//  ExampleObjectCell.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/8/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond


final class ExampleObjectCell: RCTableCell {

    var vm: ExampleObjectCellVM {
        return viewModel as! ExampleObjectCellVM
    }
    
    @IBOutlet weak var content: UILabel!
    
    override func advise() {
        
        vm.content.bind(to: content).dispose(in: bag)
    }
}

