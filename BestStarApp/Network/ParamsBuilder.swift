//
//  ParamsBuilder.swift
//  BestStarApp
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

struct ParamsBuilder {
    
    func buildMultipleAttributesDividedByPipe(attrs: [Int]) -> String {
        if attrs.isEmpty { return ""}
        var params = ""
        for attr in attrs {
            params += "\(attr)|"
        }
        params.removeLast()
        return params
    }
}
