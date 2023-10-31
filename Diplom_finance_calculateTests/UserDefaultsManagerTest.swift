//
//  UserDefaultsManagerTest.swift
//  Diplom_finance_calculateTests
//
//  Created by Sergei Otoka on 31.10.23.
//

import XCTest
@testable import Diplom_finance_calculate

final class UserDefaultsManagerTests: XCTestCase {

    var userManager: UserDefaultsManager!

    override func setUp() {
        super.setUp()
        userManager = UserDefaultsManager()
    }

    override func tearDown() {
        userManager = nil
        super.tearDown()
    }

    func testUserDefaultsManagerSetData() {
        // Arrange
        let key = UserDefaultsManager.Keys.finances
        let data = Data()

        // Act
        userManager.set(data, forKey: key)

        // Assert
        let storedData = userManager.data(forKey: key)
        XCTAssertEqual(storedData, data)
    }

    func testUserDefaultsManagerRemoveData() {
        // Arrange
        let key = UserDefaultsManager.Keys.finances
        let data = Data()
        userManager.set(data, forKey: key)

        // Act
        userManager.remove(forKey: key)

        // Assert
        let storedData = userManager.data(forKey: key)
        XCTAssertNil(storedData)
    }
}
