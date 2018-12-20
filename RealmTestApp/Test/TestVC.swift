//
//  TestVC.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/3/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond


class TestVC: UIViewController {

    var viewModel: TestVM!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TestVM()
        configureTable()
    }
    
    //MARK: - Private
    
    private func configureTable() {
        
        table.registerNibsFor(classes: [ExampleObjectCell.self])
        
        viewModel.vms
            .bind(to: table) { vms, indexPath, tableView in
                let cell       = tableView.dequeueReusableCell(withIdentifier: "ExampleObjectCell", for: indexPath) as! ExampleObjectCell
                cell.viewModel = vms[indexPath.row]
                return cell
            }
            .dispose(in: bag)
        
        table.tableFooterView = UIView()
    }
}

