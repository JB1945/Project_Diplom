//
//  ExtensionDate.swift
//  Diplom_finance_calculateTests
//
//  Created by Sergei Otoka on 31.10.23.
//

import XCTest
@testable import Diplom_finance_calculate

final class DateExtensionTests: XCTestCase {

    func testDateString() {
        // Arrange
        let date = Date()
        let dateFormat = "MMM d, h:mm a"
        let expectedDateString = DateFormatter().string(from: date)

        // Act
        let dateString = date.dateString

        // Assert
        XCTAssertNotEqual(dateString, expectedDateString)
    }
}
