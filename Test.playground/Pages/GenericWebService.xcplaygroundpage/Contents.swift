import Foundation
import UIKit
import XCPlayground
import WebKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

typealias JSONDictionary = [String: AnyObject]

let url = NSURL(string: "https://online.moysklad.ru/api/remap/1.1/entity/customerorder/61d313f6-8ba7-11e6-7a69-8f5500211ffb")!

struct CustomerOrder {
	let id: String
	let name: String
	let description: String
}

extension CustomerOrder {
	init?(dictionary: JSONDictionary) {
		guard let id = dictionary["id"] as? String,
			let name = dictionary["name"] as? String,
			let description = dictionary["description"] as? String else { return nil }
		self.id = id
		self.name = name
		self.description = description
	}
}


struct Resource<A> {
	let url: NSURL
	let parse: (NSData) -> A?
	let headers: [String: String]
}

extension Resource {
	init(url: NSURL, headers: [String: String] = [:], parseJSON: @escaping (Any) -> A?) {
		self.url = url
		self.headers = headers
		self.parse = { data in
			//let jsonString = String(data: data as Data, encoding: .utf8)
			//print("json string: \(jsonString)")
			let json = try? JSONSerialization.jsonObject(with: data as Data, options: [])
			return json.flatMap(parseJSON)
		}
	}
}

final class Webservice {
	func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
		var request = URLRequest(url: resource.url as URL)
		request.allHTTPHeaderFields = resource.headers

		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				completion(nil)
				return
			}
			
			print("Response: \((response as! HTTPURLResponse).statusCode)")
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			completion(resource.parse(data as NSData))
			}.resume()
	}
}

let pass = "admin@asefimenko2:qweasd1".data(using: .utf8)?.base64EncodedString()
let authValue = "Basic \(pass!)"

let resource: Resource<CustomerOrder> = Resource(url: url, headers: ["Authorization": authValue], parseJSON: { json in
	guard let dictionary = json as? JSONDictionary else { return nil }
	
	return CustomerOrder(dictionary: dictionary)
	})

Webservice().load(resource: resource) { result in
	print(result)
}
