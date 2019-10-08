//
//  HTTP.swift
//  Weather
//
//  Created by Yevhen Triukhan on 1/21/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

public enum HTTP {

    public enum HeaderField: String {
        case authorization = "Authorization"
        case contentType = "Content-Type"
    }

    public enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case head = "HEAD"
    }
}
