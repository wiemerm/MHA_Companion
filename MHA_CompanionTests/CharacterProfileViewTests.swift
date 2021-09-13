//
//  CharacterProfileViewTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/8/21.
//

@testable import MHA_Companion
import SwiftUI
import ViewInspector
import XCTest

class CharacterProfileViewTests: XCTestCase {
    func testProfileContainsRequiredInfo() {
        let character = Character.testInstance()
        let characterView = try? CharacterProfileView(character: character).inspect()

        XCTAssertNoThrow(try characterView?.find(ViewType.Image.self))
        XCTAssertNoThrow(try characterView?.find(text: character.displayName))
        XCTAssertNoThrow(try characterView?.find(text: "No description available"))

        let nameFont = try? characterView?.find(text: character.displayName).attributes().font()
        let descriptionFont = try? characterView?.find(text: "No description available").attributes().font()
        XCTAssertEqual(nameFont, Font.title)
        XCTAssertEqual(descriptionFont, Font.body)
    }

    func testProfile_whenAllFieldsPresent() {
        let character = Character.deku()
        let characterView = try? CharacterProfileView(character: character).inspect()

        XCTAssertNoThrow(try characterView?.find(ViewType.Image.self))
        XCTAssertNoThrow(try characterView?.find(text: character.name!))
        XCTAssertNoThrow(try characterView?.find(text: character.alias!))
        XCTAssertNoThrow(try characterView?.find(text: "Birthday:"))
        XCTAssertNoThrow(try characterView?.find(text: character.birthday!))
        XCTAssertNoThrow(try characterView?.find(text: "Hair:"))
        XCTAssertNoThrow(try characterView?.find(text: character.hair!))
        XCTAssertNoThrow(try characterView?.find(text: "Eyes:"))
        XCTAssertNoThrow(try characterView?.find(text: character.eye!))

        XCTAssertNoThrow(try characterView?.find(text: "Quirk:"))
        XCTAssertNoThrow(try characterView?.find(text: character.quirk!))
        XCTAssertNoThrow(try characterView?.find(text: "Occupation:"))
        XCTAssertNoThrow(try characterView?.find(text: character.occupation!))
        XCTAssertNoThrow(try characterView?.find(text: "Affiliation:"))
        XCTAssertNoThrow(try characterView?.find(text: character.affiliation!))
        XCTAssertNoThrow(try characterView?.find(text: "Status:"))
        XCTAssertNoThrow(try characterView?.find(text: character.status!))

        XCTAssertNoThrow(try characterView?.find(text: character.description!))

        XCTAssertEqual(try? characterView?.find(text: character.displayName).attributes().font(), Font.title)
        XCTAssertEqual(try? characterView?.find(text: character.alias!).attributes().font(), Font.title2)
        XCTAssertEqual(try? characterView?.find(text: character.description!).attributes().font(), Font.body)
    }

    func testLayoutAroundHeaderInfoIsCorrect() {
        let character = Character.deku()
        let characterView = try? CharacterProfileView(character: character).inspect()

        XCTAssertEqual(try? characterView?.findAll(AvatarImage.self).first?.actualView().size, CGSize(width: 125, height: 125))

        let parent = try? characterView?.find(text: character.alias!).parent().vStack()
        XCTAssertEqual(try? parent?.alignment(), HorizontalAlignment.leading)
        XCTAssertEqual(try? parent?.flexFrame().maxWidth, .infinity)

        XCTAssertEqual(try? parent?.parent().hStack().alignment(), VerticalAlignment.top)
        XCTAssertEqual(try? parent?.parent().parent().vStack().alignment(), HorizontalAlignment.leading)
    }

    func testLayoutAroundCharacterInfoIsCorrect() {
        let character = Character.deku()
        let characterView = try? CharacterProfileView(character: character).inspect()

        let quirkParent = try? characterView?.find(ProfileItemView.self, containing: character.quirk!).parent().vStack()
        XCTAssertEqual(try? quirkParent?.alignment(), HorizontalAlignment.leading)
        XCTAssertEqual(try? quirkParent?.flexFrame().maxWidth, .infinity)
        XCTAssertEqual(try? quirkParent?.background().foregroundColor(), Color.blue)

        let description = try? characterView?.find(text: character.description!)
        XCTAssertEqual(try? description?.attributes().font(), Font.body)
    }
}
