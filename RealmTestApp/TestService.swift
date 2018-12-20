//
//  TestService.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/5/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//


import Thrift
import ReactiveKit
import Bond
import Reachability


public final class LLTestService  {
    
    static let shared = LLTestService()
    
    private var client: TestServiceClient {
        return NetworkManager.shared.clientFor(type:  .test)
    }
    
    func getObjects() -> Signal<[TestAPIObject], BaseServiceError> {
        return Signal { obs in
            
            let bag = DisposeBag()
            
            print("TestService get object start")
            
            let dataModel = DataModel<ExampleTestAPIObjectMapper>()
            
            if Reachability()!.connection != .none {
                
                do {
                    let apiObjects = Array(try self.client.getTestAPIObjects(quantity: 1234125))
                    
                    dataModel.save(apiEntities: apiObjects)
                        .observeNext { _ in
                            obs.next(apiObjects)
                        }
                        .dispose(in: bag)
                    
                } catch {
                    print("TestService API error: \(error)")
                    obs.failed(BaseServiceError.unknown)
                }
            }
            else {
                let apiObjects = dataModel.getAllAsAPI()
                obs.next(apiObjects)
                obs.completed()
            }
            
            return BlockDisposable {
                bag.dispose()
            }
        }
    }
}

