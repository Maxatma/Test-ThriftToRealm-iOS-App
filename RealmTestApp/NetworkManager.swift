//
//  NetworkManager.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/5/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Thrift


public final class NetworkManager {
    
    static var shared = NetworkManager()    
    
    static var base: String {
        return "http://localhost:9090"
    }
    
    enum URLConstants: String {
        case  test = "/"
    }
    
    func clientFor<T: TClient>(type: URLConstants) -> T {
        let proto  = NetworkManager.shared.protoFor(type: type)
        let client = T(inoutProtocol: proto)
        
        return client
    }
    
    func protoFor(type: URLConstants) -> TProtocol {
        
        let URLString        = NetworkManager.base + type.rawValue
        let url              = URL(string: URLString)!
        let urlSession       = URLSession(configuration: .default)
        
        let transportFactory = THTTPSessionTransport.Factory(session: urlSession, url: url)
        let transport        = transportFactory.newTransport()
        let proto            = TBinaryProtocol(on: transport)
        
        return proto
    }
}

