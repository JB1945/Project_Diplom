//
//  Weak.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 25.10.23.
//

import Foundation

struct Weak<T> {

    public var value: T? {
        capturedValue()
    }

    private let capturedValue: () -> T?

    public init(_ value: T) {
        if let value = value as? AnyObject {
            capturedValue = { [weak value] in value as? T }
        } else {
            capturedValue = { value }
        }
    }
}
