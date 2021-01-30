//
//  CodableExtension.swift
//  Core
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

public extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var convertData: Data {
        return try! JSONEncoder().encode(self)
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: convertData)) as? [String: Any] ?? [:]
    }
}
