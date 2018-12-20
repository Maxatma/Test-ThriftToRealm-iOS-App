import RealmSwift
import Thrift


public protocol MapperProtocol {
    associatedtype APIEntity: AnyObject
    associatedtype RealmEntity: Object
    
    init()
    func map(apiEntity: APIEntity, into entity: RealmEntity) -> RealmEntity
    func map(entity: RealmEntity, into apiEntity: APIEntity) -> APIEntity
    func map(entity: RealmEntity?) -> APIEntity?
}

