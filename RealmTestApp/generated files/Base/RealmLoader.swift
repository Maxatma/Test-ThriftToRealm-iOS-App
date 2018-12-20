import RealmSwift


public final class RealmLoader {
    public static let shared = RealmLoader()
    // Initialize this in AppDelegate or before db usage
    public var key: Data!

    public func loadRealm() throws -> Realm {
        
        let configuration = Realm.Configuration(encryptionKey: key)
        do {
            let realm = try Realm(configuration: configuration)
            return realm
        }
        catch  {
            throw KZDataModelError.decryptionFailed
        }
    }
}

enum KZDataModelError: Error {
    case decryptionFailed
}
