/**
 * Autogenerated by Thrift Compiler (1.0.0-dev)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

import Foundation

import Thrift


public func ==(lhs: TestAPIObject, rhs: TestAPIObject) -> Bool {
  return
    (lhs.id == rhs.id) &&
    (lhs.optionalIntSixtyFour == rhs.optionalIntSixtyFour) &&
    (lhs.nonOptionalIntSixtyFour == rhs.nonOptionalIntSixtyFour) &&
    (lhs.optionalIntThirtyTwo == rhs.optionalIntThirtyTwo) &&
    (lhs.nonOptionalThirtyTwo == rhs.nonOptionalThirtyTwo) &&
    (lhs.optionalBool == rhs.optionalBool) &&
    (lhs.nonOptionalBool == rhs.nonOptionalBool) &&
    (lhs.optionalString == rhs.optionalString) &&
    (lhs.nonOptionalString == rhs.nonOptionalString) &&
    (lhs.nestedType == rhs.nestedType) &&
    (lhs.nestedTypesList == rhs.nestedTypesList)
}

extension TestAPIObject : CustomStringConvertible {

  public var description : String {
    var desc = "TestAPIObject("
    desc += "id=\(String(describing: self.id)), "
    desc += "optionalIntSixtyFour=\(String(describing: self.optionalIntSixtyFour)), "
    desc += "nonOptionalIntSixtyFour=\(String(describing: self.nonOptionalIntSixtyFour)), "
    desc += "optionalIntThirtyTwo=\(String(describing: self.optionalIntThirtyTwo)), "
    desc += "nonOptionalThirtyTwo=\(String(describing: self.nonOptionalThirtyTwo)), "
    desc += "optionalBool=\(String(describing: self.optionalBool)), "
    desc += "nonOptionalBool=\(String(describing: self.nonOptionalBool)), "
    desc += "optionalString=\(String(describing: self.optionalString)), "
    desc += "nonOptionalString=\(String(describing: self.nonOptionalString)), "
    desc += "nestedType=\(String(describing: self.nestedType)), "
    desc += "nestedTypesList=\(String(describing: self.nestedTypesList))"
    return desc
  }

}

extension TestAPIObject : Hashable {

  public var hashValue : Int {
    let prime = 31
    var result = 1
    result = prime &* result &+ (id?.hashValue ?? 0)
    result = prime &* result &+ (optionalIntSixtyFour?.hashValue ?? 0)
    result = prime &* result &+ (nonOptionalIntSixtyFour.hashValue)
    result = prime &* result &+ (optionalIntThirtyTwo?.hashValue ?? 0)
    result = prime &* result &+ (nonOptionalThirtyTwo.hashValue)
    result = prime &* result &+ (optionalBool?.hashValue ?? 0)
    result = prime &* result &+ (nonOptionalBool.hashValue)
    result = prime &* result &+ (optionalString?.hashValue ?? 0)
    result = prime &* result &+ (nonOptionalString.hashValue)
    result = prime &* result &+ (nestedType?.hashValue ?? 0)
    result = prime &* result &+ (nestedTypesList?.hashValue ?? 0)
    return result
  }

}

extension TestAPIObject : TStruct {

  public static var fieldIds: [String: Int32] {
    return ["id": 1, "optionalIntSixtyFour": 2, "nonOptionalIntSixtyFour": 3, "optionalIntThirtyTwo": 4, "nonOptionalThirtyTwo": 5, "optionalBool": 6, "nonOptionalBool": 7, "optionalString": 8, "nonOptionalString": 9, "nestedType": 10, "nestedTypesList": 11, ]
  }

  public static var structName: String { return "TestAPIObject" }

  public static func read(from proto: TProtocol) throws -> TestAPIObject {
    _ = try proto.readStructBegin()
    var id: String?
    var optionalIntSixtyFour: Int64?
    var nonOptionalIntSixtyFour: Int64!
    var optionalIntThirtyTwo: Int32?
    var nonOptionalThirtyTwo: Int32!
    var optionalBool: Bool?
    var nonOptionalBool: Bool!
    var optionalString: String?
    var nonOptionalString: String!
    var nestedType: TestAPIObject?
    var nestedTypesList: TList<TestAPIObject>?

    fields: while true {

      let (_, fieldType, fieldID) = try proto.readFieldBegin()

      switch (fieldID, fieldType) {
        case (_, .stop):            break fields
        case (1, .string):           id = try String.read(from: proto)
        case (2, .i64):             optionalIntSixtyFour = try Int64.read(from: proto)
        case (3, .i64):             nonOptionalIntSixtyFour = try Int64.read(from: proto)
        case (4, .i32):             optionalIntThirtyTwo = try Int32.read(from: proto)
        case (5, .i32):             nonOptionalThirtyTwo = try Int32.read(from: proto)
        case (6, .bool):            optionalBool = try Bool.read(from: proto)
        case (7, .bool):            nonOptionalBool = try Bool.read(from: proto)
        case (8, .string):           optionalString = try String.read(from: proto)
        case (9, .string):           nonOptionalString = try String.read(from: proto)
        case (10, .struct):           nestedType = try TestAPIObject.read(from: proto)
        case (11, .list):            nestedTypesList = try TList<TestAPIObject>.read(from: proto)
        case let (_, unknownType):  try proto.skip(type: unknownType)
      }

      try proto.readFieldEnd()
    }

    try proto.readStructEnd()
    // Required fields
    try proto.validateValue(nonOptionalIntSixtyFour, named: "nonOptionalIntSixtyFour")
    try proto.validateValue(nonOptionalThirtyTwo, named: "nonOptionalThirtyTwo")
    try proto.validateValue(nonOptionalBool, named: "nonOptionalBool")
    try proto.validateValue(nonOptionalString, named: "nonOptionalString")

    return TestAPIObject(id: id, optionalIntSixtyFour: optionalIntSixtyFour, nonOptionalIntSixtyFour: nonOptionalIntSixtyFour, optionalIntThirtyTwo: optionalIntThirtyTwo, nonOptionalThirtyTwo: nonOptionalThirtyTwo, optionalBool: optionalBool, nonOptionalBool: nonOptionalBool, optionalString: optionalString, nonOptionalString: nonOptionalString, nestedType: nestedType, nestedTypesList: nestedTypesList)
  }

}



fileprivate final class TestService_getName_args {


  fileprivate init() { }
}

fileprivate func ==(lhs: TestService_getName_args, rhs: TestService_getName_args) -> Bool {
  return true
}

extension TestService_getName_args : Hashable {

  fileprivate var hashValue : Int {
    return 31
  }

}

extension TestService_getName_args : TStruct {

  fileprivate static var fieldIds: [String: Int32] {
    return [:]
  }

  fileprivate static var structName: String { return "TestService_getName_args" }

  fileprivate static func read(from proto: TProtocol) throws -> TestService_getName_args {
    _ = try proto.readStructBegin()

    fields: while true {

      let (_, fieldType, fieldID) = try proto.readFieldBegin()

      switch (fieldID, fieldType) {
        case (_, .stop):            break fields
        case let (_, unknownType):  try proto.skip(type: unknownType)
      }

      try proto.readFieldEnd()
    }

    try proto.readStructEnd()

    return TestService_getName_args()
  }

}



fileprivate final class TestService_getName_result {

  fileprivate var success: String?


  fileprivate init() { }
  fileprivate init(success: String?) {
    self.success = success
  }

}

fileprivate func ==(lhs: TestService_getName_result, rhs: TestService_getName_result) -> Bool {
  return
    (lhs.success == rhs.success)
}

extension TestService_getName_result : Hashable {

  fileprivate var hashValue : Int {
    let prime = 31
    var result = 1
    result = prime &* result &+ (success?.hashValue ?? 0)
    return result
  }

}

extension TestService_getName_result : TStruct {

  fileprivate static var fieldIds: [String: Int32] {
    return ["success": 0, ]
  }

  fileprivate static var structName: String { return "TestService_getName_result" }

  fileprivate static func read(from proto: TProtocol) throws -> TestService_getName_result {
    _ = try proto.readStructBegin()
    var success: String?

    fields: while true {

      let (_, fieldType, fieldID) = try proto.readFieldBegin()

      switch (fieldID, fieldType) {
        case (_, .stop):            break fields
        case (0, .string):           success = try String.read(from: proto)
        case let (_, unknownType):  try proto.skip(type: unknownType)
      }

      try proto.readFieldEnd()
    }

    try proto.readStructEnd()

    return TestService_getName_result(success: success)
  }

}



fileprivate final class TestService_getTestAPIObjects_args {

  fileprivate var quantity: Int64


  fileprivate init(quantity: Int64) {
    self.quantity = quantity
  }

}

fileprivate func ==(lhs: TestService_getTestAPIObjects_args, rhs: TestService_getTestAPIObjects_args) -> Bool {
  return
    (lhs.quantity == rhs.quantity)
}

extension TestService_getTestAPIObjects_args : Hashable {

  fileprivate var hashValue : Int {
    let prime = 31
    var result = 1
    result = prime &* result &+ (quantity.hashValue)
    return result
  }

}

extension TestService_getTestAPIObjects_args : TStruct {

  fileprivate static var fieldIds: [String: Int32] {
    return ["quantity": 1, ]
  }

  fileprivate static var structName: String { return "TestService_getTestAPIObjects_args" }

  fileprivate static func read(from proto: TProtocol) throws -> TestService_getTestAPIObjects_args {
    _ = try proto.readStructBegin()
    var quantity: Int64!

    fields: while true {

      let (_, fieldType, fieldID) = try proto.readFieldBegin()

      switch (fieldID, fieldType) {
        case (_, .stop):            break fields
        case (1, .i64):             quantity = try Int64.read(from: proto)
        case let (_, unknownType):  try proto.skip(type: unknownType)
      }

      try proto.readFieldEnd()
    }

    try proto.readStructEnd()
    // Required fields
    try proto.validateValue(quantity, named: "quantity")

    return TestService_getTestAPIObjects_args(quantity: quantity)
  }

}



fileprivate final class TestService_getTestAPIObjects_result {

  fileprivate var success: TList<TestAPIObject>?


  fileprivate init() { }
  fileprivate init(success: TList<TestAPIObject>?) {
    self.success = success
  }

}

fileprivate func ==(lhs: TestService_getTestAPIObjects_result, rhs: TestService_getTestAPIObjects_result) -> Bool {
  return
    (lhs.success == rhs.success)
}

extension TestService_getTestAPIObjects_result : Hashable {

  fileprivate var hashValue : Int {
    let prime = 31
    var result = 1
    result = prime &* result &+ (success?.hashValue ?? 0)
    return result
  }

}

extension TestService_getTestAPIObjects_result : TStruct {

  fileprivate static var fieldIds: [String: Int32] {
    return ["success": 0, ]
  }

  fileprivate static var structName: String { return "TestService_getTestAPIObjects_result" }

  fileprivate static func read(from proto: TProtocol) throws -> TestService_getTestAPIObjects_result {
    _ = try proto.readStructBegin()
    var success: TList<TestAPIObject>?

    fields: while true {

      let (_, fieldType, fieldID) = try proto.readFieldBegin()

      switch (fieldID, fieldType) {
        case (_, .stop):            break fields
        case (0, .list):            success = try TList<TestAPIObject>.read(from: proto)
        case let (_, unknownType):  try proto.skip(type: unknownType)
      }

      try proto.readFieldEnd()
    }

    try proto.readStructEnd()

    return TestService_getTestAPIObjects_result(success: success)
  }

}



extension TestServiceClient : TestService {

  private func send_getName() throws {
    try outProtocol.writeMessageBegin(name: "getName", type: .call, sequenceID: 0)
    let args = TestService_getName_args()
    try args.write(to: outProtocol)
    try outProtocol.writeMessageEnd()
  }

  private func recv_getName() throws -> String {
    try inProtocol.readResultMessageBegin() 
    let result = try TestService_getName_result.read(from: inProtocol)
    try inProtocol.readMessageEnd()

    if let success = result.success {
      return success
    }
    throw TApplicationError(error: .missingResult(methodName: "getName"))
  }

  public func getName() throws -> String {
    try send_getName()
    try outProtocol.transport.flush()
    return try recv_getName()
  }

  private func send_getTestAPIObjects(quantity: Int64) throws {
    try outProtocol.writeMessageBegin(name: "getTestAPIObjects", type: .call, sequenceID: 0)
    let args = TestService_getTestAPIObjects_args(quantity: quantity)
    try args.write(to: outProtocol)
    try outProtocol.writeMessageEnd()
  }

  private func recv_getTestAPIObjects() throws -> TList<TestAPIObject> {
    try inProtocol.readResultMessageBegin() 
    let result = try TestService_getTestAPIObjects_result.read(from: inProtocol)
    try inProtocol.readMessageEnd()

    if let success = result.success {
      return success
    }
    throw TApplicationError(error: .missingResult(methodName: "getTestAPIObjects"))
  }

  public func getTestAPIObjects(quantity: Int64) throws -> TList<TestAPIObject> {
    try send_getTestAPIObjects(quantity: quantity)
    try outProtocol.transport.flush()
    return try recv_getTestAPIObjects()
  }

}

extension TestServiceProcessor : TProcessor {

  static let processorHandlers: ProcessorHandlerDictionary = {

    var processorHandlers = ProcessorHandlerDictionary()

    processorHandlers["getName"] = { sequenceID, inProtocol, outProtocol, handler in

      let args = try TestService_getName_args.read(from: inProtocol)

      try inProtocol.readMessageEnd()

      var result = TestService_getName_result()
      do {
        result.success = try handler.getName()
      }
      catch let error { throw error }

      try outProtocol.writeMessageBegin(name: "getName", type: .reply, sequenceID: sequenceID)
      try result.write(to: outProtocol)
      try outProtocol.writeMessageEnd()
    }
    processorHandlers["getTestAPIObjects"] = { sequenceID, inProtocol, outProtocol, handler in

      let args = try TestService_getTestAPIObjects_args.read(from: inProtocol)

      try inProtocol.readMessageEnd()

      var result = TestService_getTestAPIObjects_result()
      do {
        result.success = try handler.getTestAPIObjects(quantity: args.quantity)
      }
      catch let error { throw error }

      try outProtocol.writeMessageBegin(name: "getTestAPIObjects", type: .reply, sequenceID: sequenceID)
      try result.write(to: outProtocol)
      try outProtocol.writeMessageEnd()
    }
    return processorHandlers
  }()

  public func process(on inProtocol: TProtocol, outProtocol: TProtocol) throws {

    let (messageName, _, sequenceID) = try inProtocol.readMessageBegin()

    if let processorHandler = TestServiceProcessor.processorHandlers[messageName] {
      do {
        try processorHandler(sequenceID, inProtocol, outProtocol, service)
      }
      catch let error as TApplicationError {
        try outProtocol.writeException(messageName: messageName, sequenceID: sequenceID, ex: error)
      }
    }
    else {
      try inProtocol.skip(type: .struct)
      try inProtocol.readMessageEnd()
      let ex = TApplicationError(error: .unknownMethod(methodName: messageName))
      try outProtocol.writeException(messageName: messageName, sequenceID: sequenceID, ex: ex)
    }
  }
}

