//
//  CodableEnum.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 12.08.2021.
//

public protocol CodableEnum: Codable {
    static var unknown: Self { get }
}

public extension CodableEnum where Self: RawRepresentable, Self.RawValue == String {
    init(from decoder: Decoder) throws {
        self = (try? Self(rawValue: decoder.singleValueContainer().decode(RawValue.self))) ?? .unknown
    }
}
