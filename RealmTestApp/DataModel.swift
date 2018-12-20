//
//  DataModel.swift
//  RealmTestApp
//
//  Created by Alexander Zaporozhchenko on 11/5/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import RealmSwift
import ReactiveKit


class DataModel<M: MapperProtocol> {
    
    fileprivate let mapper = M.init()
    
    typealias E = M.RealmEntity
    typealias A = M.APIEntity
    
    func loadRealm() throws -> Realm {
        
        let configuration = Realm.Configuration(encryptionKey: DataModel<M>.getKey() as Data)
        do {
            let realm = try Realm(configuration: configuration)
            return realm
        }
        catch  {
            throw DMError.decryptionFailed
        }
    }
    
    class func getKey() -> NSData {
        
        let keychainIdentifier     = "test.db.encryption.key"
        let keychainIdentifierData = keychainIdentifier.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        
        var query: [NSString: AnyObject] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecReturnData: true as AnyObject
        ]
        
        // To avoid Swift optimization bug, should use withUnsafeMutablePointer() function to retrieve the keychain item
        var dataTypeRef: AnyObject?
        
        var status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0)) }
        
        if status == errSecSuccess {
            return dataTypeRef as! NSData
        }
        
        let keyData = NSMutableData(length: 64)!
        let result  = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
        
        assert(result == 0, "Failed to get random bytes")
        
        query = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecValueData: keyData
        ]
        
        status = SecItemAdd(query as CFDictionary, nil)
        assert(status == errSecSuccess, "Failed to insert the new key in the keychain")
        
        return keyData
    }
    
    func save(apiEntity: A) {
        
        let realm = try! loadRealm()
        realm.beginWrite()
        
        var realmEntity = E()
        realmEntity     = self.mapper.map(apiEntity: apiEntity, into: realmEntity)
        realm.add(realmEntity, update:true)
        
        try! realm.commitWrite()
        
        realm.refresh()
    }
    
    
    func save(apiEntity: A) -> Signal<A, DMError>  {
        
        return Signal { obs in
            
            let realm = try! self.loadRealm()
            
            realm.beginWrite()
            var realmEntity = E()
            
            realmEntity = self.mapper.map(apiEntity: apiEntity, into: realmEntity)
            realm.add(realmEntity, update:true)
            
            try! realm.commitWrite()
            
            obs.next(apiEntity)
            obs.completed()
            
            return BlockDisposable { }
        }
    }
    
    //Rework using functions, not a signals
    func save(apiEntities: [A]) -> Signal<[A], DMError> {
        
        return Signal { obs in
            let realm = try! self.loadRealm()
            
            realm.beginWrite()
            
            let entities: [E] = apiEntities
                .map { apiEntity in
                    var realmEntity = E()
                    realmEntity = self.mapper.map(apiEntity: apiEntity, into: realmEntity)
                    return realmEntity
            }
            
            
            realm.add(entities, update:true)
            try! realm.commitWrite()
            
            obs.next(apiEntities)
            obs.completed()
            
            return BlockDisposable { }
        }
    }
    
    func save(entity: E) -> Signal<E, DMError> {
        
        return Signal { obs in
            
            let realm = try! self.loadRealm()
            
            realm.beginWrite()
            
            realm.add(entity, update:true)
            realm.refresh()
            
            try! realm.commitWrite()
            
            obs.next(entity)
            obs.completed()
            
            return BlockDisposable { }
        }
    }
    
    func getAll() -> [E] {
        let realm = try! loadRealm()
        realm.refresh()
        
        return Array(realm.objects(E.self))
    }
    
    func getAllAsAPI() -> [A] {
        let realm = try! loadRealm()
        realm.refresh()
        let realmObjects = Array(realm.objects(E.self))
        let apiObjects = realmObjects.compactMap { mapper.map(entity: $0) }
        return apiObjects
    }
    
    func getEntities(ids: [String]) -> [E] {
        let realm = try! loadRealm()
        realm.refresh()
        
        let predicate = NSPredicate(format: "id IN %@", ids)
        let result    = realm.objects(E.self).filter(predicate)
        
        return Array(result)
    }
    
    func getEntity(id: String?) -> A? {
        
        guard id != nil else {
            return nil
        }
        
        let realm = try! loadRealm()
        realm.refresh()
        guard let realmEntity = realm.object(ofType: E.self, forPrimaryKey: id) else  {
            return nil
        }
        return mapper.map(entity: realmEntity)
    }
}

enum DMError: Error {
    case unknown
    case decryptionFailed
}

