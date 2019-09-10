//
//  XCTestCase+Tester.swift
//  BestStarAppUITests
//
//  Created by Marco Henrique Maia Marques on 10/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

extension XCTestCase {
    
    var tester: KIFUITestActor { return tester() }
    var system: KIFSystemTestActor { return system() }
    
    private func tester(_ file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    private func system(_ file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
