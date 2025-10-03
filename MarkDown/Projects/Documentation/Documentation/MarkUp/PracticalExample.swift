import Foundation

// MARK: Class / Struct Documentation
/**
 Little description for the class
 
 Complete overview for the class
 
 - Authors: Nombre del primer autor\
 Nombre del segundo autor\
 Nombre del tercer autor
 - Version: 0.1 (61A329)
 */
class YourClassName {
    // MARK: Attribute Documentation
    /// Very simple description about your attribute
    var yourFirstAttribute: String = ""
    /**
     Little escription about your attribute
     
     Complete discussion about your attribute usage and its possible values
     */
    var yourSecondAttributeName: Int = 0
    
    // MARK: Function Documentation
    /**
     Little description for the function
     
     Complete summary for this function
     
     - Parameters:
        - parameterOne: Description for the first parameter of type `Int`
        - parameterTwo: Description for the second parameter of type `String`
     - Returns: Description for the return value of type `UUID`
     - Throws: `Error.Type`
     */
    func yourFunctionName(parameterOne: Int, parameterTwo: String) throws -> UUID {
        return UUID()
    }
}

// MARK: Protocol Documentation
/**
 Little description for the protocol
 
 Complete overview for the protocol
 
 - Author: Nombre del autor
 */
protocol YourProtocolName {
    // MARK: Protocol Function Documentation
    /**
     Little description for your function
     
     Summary for the function usage making reference to `YourProtocolName`
     */
    func protocolFunction()
}

// https://support.apple.com/es-mx/guide/pages/tan5b8c588d6/mac
