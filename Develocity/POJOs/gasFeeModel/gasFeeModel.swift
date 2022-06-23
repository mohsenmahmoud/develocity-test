/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct gasFeeModel : Codable {
	let result : Result?
	let responseMessage : String?
	let responseCode : Int?

	enum CodingKeys: String, CodingKey {

		case result = "result"
		case responseMessage = "responseMessage"
		case responseCode = "responseCode"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		result = try values.decodeIfPresent(Result.self, forKey: .result)
		responseMessage = try values.decodeIfPresent(String.self, forKey: .responseMessage)
		responseCode = try values.decodeIfPresent(Int.self, forKey: .responseCode)
	}
    
    
    struct Result : Codable {
        let buyTax : Int?
        let sellTax : Int?
        let buyGasFee : Int?
        let sellGasFee : Int?
        let tranferGasFee : String?
        let buyGasFeeUSD : String?
        let sellGasFeeUSD : String?
        let tranferGasFeeUSD : String?
        let contractType : String?

        enum CodingKeys: String, CodingKey {

            case buyTax = "buyTax"
            case sellTax = "sellTax"
            case buyGasFee = "buyGasFee"
            case sellGasFee = "sellGasFee"
            case tranferGasFee = "tranferGasFee"
            case buyGasFeeUSD = "buyGasFeeUSD"
            case sellGasFeeUSD = "sellGasFeeUSD"
            case tranferGasFeeUSD = "tranferGasFeeUSD"
            case contractType = "contractType"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            buyTax = try values.decodeIfPresent(Int.self, forKey: .buyTax)
            sellTax = try values.decodeIfPresent(Int.self, forKey: .sellTax)
            buyGasFee = try values.decodeIfPresent(Int.self, forKey: .buyGasFee)
            sellGasFee = try values.decodeIfPresent(Int.self, forKey: .sellGasFee)
            tranferGasFee = try values.decodeIfPresent(String.self, forKey: .tranferGasFee)
            buyGasFeeUSD = try values.decodeIfPresent(String.self, forKey: .buyGasFeeUSD)
            sellGasFeeUSD = try values.decodeIfPresent(String.self, forKey: .sellGasFeeUSD)
            tranferGasFeeUSD = try values.decodeIfPresent(String.self, forKey: .tranferGasFeeUSD)
            contractType = try values.decodeIfPresent(String.self, forKey: .contractType)
        }

    }

}
