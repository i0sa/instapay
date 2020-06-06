//
//  Constants.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//
import Foundation

struct Constants {
    static let baseURL = "https://www.paytabs.com/apiv3/"
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded; charset=utf-8"
    case accept = "*/*"
    case acceptEncoding = "gzip;q=1.0, compress;q=0.5"
}
