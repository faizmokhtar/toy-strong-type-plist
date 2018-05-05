//
//  PlistFile.swift
//  toy-strong-type-plist
//
//  Created by Faiz Mokhtar on 05/05/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

public class PlistFile<Value: Codable> {
    public enum Errors: Error {
        case fileNotFound
    }

    public enum Source {
        case infoPlist(_ : Bundle)
        case plist(_: String, _: Bundle)

        internal func data() throws -> Data {
            switch self {
            case .infoPlist(let bundle):
                guard let infoDict = bundle.infoDictionary else {
                    throw Errors.fileNotFound
                }
                return try JSONSerialization.data(withJSONObject: infoDict, options: .prettyPrinted)
            case .plist(let filename, let bundle):
                guard let path = bundle.path(forResource: filename, ofType: "plist") else {
                    throw Errors.fileNotFound
                }
                return try Data(contentsOf: URL(fileURLWithPath: path))
            }
        }
    }

    public let data: Value

    public init(_ file: PlistFile.Source = .infoPlist(Bundle.main)) throws {
        let rawData = try file.data()
        let decoder = JSONDecoder()
        self.data = try decoder.decode(Value.self, from: rawData)
    }
}
