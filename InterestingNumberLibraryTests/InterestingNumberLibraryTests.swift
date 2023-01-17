//
//  InterestingNumberLibraryTests.swift
//  InterestingNumberLibraryTests
//
//  Created by Roman Ivanov on 17.01.2023.
//

import XCTest
@testable import InterestingNumberLibrary

final class InterestingNumberLibraryTests: XCTestCase {

    private var queryService: NumbersService!
    override func setUpWithError() throws {
        queryService = NumbersService()

    }

    func test_with_success_response() async throws {
        let sampleData = InterestingNumberLibraryTests.getSampleData()
        let mockData = try JSONEncoder().encode(sampleData)

        MockURLProtocol.requestHandler = { _ in
            return (HTTPURLResponse(), mockData)
        }

        let result = try await queryService.getFacts(numbers: "2,1,3")
        XCTAssertEqual(Array(result.keys).sorted(by: <), Array(sampleData.keys).sorted(by: <))
    }

    static func getSampleData() -> [String: String] {
        return [
            "2": "2 is the price in cents per acre the USA bought Alaska from Russia.",
            "1": "1 is the number of moons orbiting Earth.",
            "3": "3 is the number of witches in William Shakespeare\'s Macbeth."
        ]
    }

    func testIsValidNumberInRange() {
        XCTAssertTrue(TextFieldModel.isValidNumberInRange("1..3"))
    }

    func testIsInvalidNumberInRange() {
        XCTAssertFalse(TextFieldModel.isValidNumberInRange("3..1"))
    }

    func testIsValidMultipleNumers() {
        XCTAssertTrue(TextFieldModel.isValidMultipleNumbers("1,2,3"))
    }
    func testIsInvalidMultipleNumbers() {
        XCTAssertFalse(TextFieldModel.isValidMultipleNumbers("1,2,3,"))
    }

}
