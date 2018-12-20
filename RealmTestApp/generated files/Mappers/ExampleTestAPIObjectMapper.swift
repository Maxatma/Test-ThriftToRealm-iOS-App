import RealmSwift
import Thrift


open class ExampleTestAPIObjectMapper: MapperProtocol {
    public static var shared = ExampleTestAPIObjectMapper()
        
    public required init() { }
        
public func map(apiEntity: TestAPIObject, into entity: ExampleTestAPIObject) -> ExampleTestAPIObject {
    if entity.value(forKey: "id") == nil {
        entity.setValue(apiEntity.id, forKey: "id")
    }


    entity.optionalIntSixtyFour.value = apiEntity.optionalIntSixtyFour

    entity.nonOptionalIntSixtyFour = apiEntity.nonOptionalIntSixtyFour

    entity.optionalIntThirtyTwo.value = apiEntity.optionalIntThirtyTwo

    entity.nonOptionalThirtyTwo = apiEntity.nonOptionalThirtyTwo

    entity.optionalBool.value = apiEntity.optionalBool

    entity.nonOptionalBool = apiEntity.nonOptionalBool

    entity.optionalString = apiEntity.optionalString

    entity.nonOptionalString = apiEntity.nonOptionalString

    if let apinestedType = apiEntity.nestedType , apinestedType.id != nil {
    let mapper       = ExampleTestAPIObjectMapper.shared
    let returnEntity = mapper.getOrCreate(primaryKey: apinestedType.id!)
    entity.nestedType   = mapper.map(apiEntity: apinestedType, into: returnEntity)
    } else {
    entity.nestedType = nil
    }

    entity.nestedTypesList.removeAll()
    if let apinestedTypesList = apiEntity.nestedTypesList {
    let realmnestedTypesList: [ExampleTestAPIObject] = apinestedTypesList.map { apiValue  in
        let mapper       = ExampleTestAPIObjectMapper.shared
        var returnEntity = mapper.getOrCreate(primaryKey: apiValue.id!)
            returnEntity = mapper.map(apiEntity: apiValue, into: returnEntity)
            return returnEntity
        }
    
        let realm = try! RealmLoader.shared.loadRealm()
        realm.add(realmnestedTypesList, update:true)
        entity.nestedTypesList.append(objectsIn:realmnestedTypesList)
    }
    return entity
}
public func map(entity: ExampleTestAPIObject, into apiEntity: TestAPIObject) -> TestAPIObject {
apiEntity.id = entity.id
    apiEntity.optionalIntSixtyFour = entity.optionalIntSixtyFour.value
    apiEntity.nonOptionalIntSixtyFour = entity.nonOptionalIntSixtyFour
    apiEntity.optionalIntThirtyTwo = entity.optionalIntThirtyTwo.value
    apiEntity.nonOptionalThirtyTwo = entity.nonOptionalThirtyTwo
    apiEntity.optionalBool = entity.optionalBool.value
    apiEntity.nonOptionalBool = entity.nonOptionalBool
    apiEntity.optionalString = entity.optionalString
    apiEntity.nonOptionalString = entity.nonOptionalString
    apiEntity.nestedType = ExampleTestAPIObjectMapper.shared.map(entity: entity.nestedType)
    apiEntity.nestedTypesList = TList(Array(entity.nestedTypesList.compactMap { ExampleTestAPIObjectMapper.shared.map(entity: $0) }))
    return apiEntity
}
public func map(entity: ExampleTestAPIObject?) -> TestAPIObject? {
    guard let entity = entity else { return nil }
    return TestAPIObject(
id: entity.id,
    optionalIntSixtyFour: entity.optionalIntSixtyFour.value,
    nonOptionalIntSixtyFour: entity.nonOptionalIntSixtyFour,
    optionalIntThirtyTwo: entity.optionalIntThirtyTwo.value,
    nonOptionalThirtyTwo: entity.nonOptionalThirtyTwo,
    optionalBool: entity.optionalBool.value,
    nonOptionalBool: entity.nonOptionalBool,
    optionalString: entity.optionalString,
    nonOptionalString: entity.nonOptionalString,
    nestedType: ExampleTestAPIObjectMapper.shared.map(entity: entity.nestedType),
    nestedTypesList: TList(Array(entity.nestedTypesList.compactMap { ExampleTestAPIObjectMapper.shared.map(entity: $0) }))
    )
}
public func getOrCreate(primaryKey: String? = nil) -> ExampleTestAPIObject {
        
        let realm = try! RealmLoader.shared.loadRealm()
        
        if primaryKey == nil {
            return ExampleTestAPIObject()
        }
        
        let savedObject  = realm.object(ofType: ExampleTestAPIObject.self, forPrimaryKey: primaryKey)
        let returnEntity = savedObject ?? ExampleTestAPIObject()

        return returnEntity
}
}

