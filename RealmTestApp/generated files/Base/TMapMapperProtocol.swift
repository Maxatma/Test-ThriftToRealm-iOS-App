import RealmSwift
import Thrift


public protocol TMapMapperProtocol {
    associatedtype Key: Any
    associatedtype Value: Any
    associatedtype RealmEntity: Object

    typealias apiEntity = (key: Key, value: Value)

    init()
    func map(apiEntity: apiEntity, into entity: RealmEntity) -> RealmEntity
    func map(entity: RealmEntity) -> apiEntity
}

