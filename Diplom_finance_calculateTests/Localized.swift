//
//  Diplom_finance_calculateTests.swift
//  Diplom_finance_calculateTests
//
//  Created by Sergei Otoka on 31.10.23.
//

import XCTest
@testable import Diplom_finance_calculate

final class LocalizableTests: XCTestCase {

    func testLocalized() {
        // Arrange
        let stringKey = "hello_text"

        // Act
        let localizedString = stringKey.localizable()

        // Assert
        XCTAssertNotEqual(localizedString, "Hello")
    }
}
