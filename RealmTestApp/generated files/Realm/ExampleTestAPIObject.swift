

import RealmSwift



open class ExampleTestAPIObject: Object {
override open static func primaryKey() -> String? {
    return "id"
}
    
    @objc public dynamic var id: String?

    
    public let optionalIntSixtyFour = RealmOptional<Int64>()

    
    @objc public dynamic var nonOptionalIntSixtyFour: Int64 = 0

    
    public let optionalIntThirtyTwo = RealmOptional<Int32>()

    
    @objc public dynamic var nonOptionalThirtyTwo: Int32 = 0

    
    public let optionalBool = RealmOptional<Bool>()

    
    @objc public dynamic var nonOptionalBool = false

    
    @objc public dynamic var optionalString: String?

    
    @objc public dynamic var nonOptionalString = "" 

    
    @objc public dynamic var nestedType: ExampleTestAPIObject?

    
    public let nestedTypesList = List<ExampleTestAPIObject>()
}

