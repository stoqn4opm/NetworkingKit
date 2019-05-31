# NetworkingKit

![](https://img.shields.io/badge/version-1.0-brightgreen.svg)

Simple Dynamic Framework, providing abstraction over `Foundation`'s networking classes

`NetworkingKit` contains wrapper classes of `URLSession` that give you the option to make a API call by subclassing `Endpoint` and providing network specific settings as ovverrides in your class.

By doing this, `NetworkingKit` is able to achieve syntax of web call at user level (app level) that look like:
```swift

SampleGet.Call { result, error in
	// Where `result` is of your custom type set as Generic Type
	// and `error` is of kind Endpoint.Error
}
```

or

```swift
SamplePost.Call(withRequestData: data) { result, error in
	// Where `data` is of your custom type set as Generic Type
	// Where `result` is of your custom type set as Generic Type
	// and `error` is of kind Endpoint.Error
}
```

Build using Swift 5, XCode 10.2, supports iOS 10.0+

# Usage

1. Import the `NetworkingKit` framework to your file.
```swift
import NetworkingKit
```
2. Subclass either 
```swift
Endpoint.WithRequestAndResponseType<RequestDataType: Encodable, ResponseDataType: Codable>
```
or
```swift
Endpoint.WithResponseTypeOnly<ResponseDataType: Codable>
```

Depending on whether you would like to send http request body in your call.
3. Provide custom `RequestDataType` and/or `ResponseDataType` to your liking
4. Set various communication parameters like `host`, `scheme`, `port`, `timeout`, etc... by overriding the inherited computed variables in your subclass
5. Call the inherited constructor of your subclass with appropriate completion block (the parameter types are inherited automatically) and in the case of `Endpoint.WithRequestAndResponseType` provide your reqest data too as init parameter.
6. By default `NetworkingKit`,  uses `JSONEncoder` and `JSONDecoder` classes for parsing and conversion of the request data type to raw http body data and response data to the custom type, but if these conversions are not suitable for your case, you can override `encodeRequest()` and `decodeResponse()`  to provide custom conversions to fit your needs.

# Example

```swift
/// This is how you define a sample GET endpoint
final  class Call: Endpoint.WithResponseTypeOnly<Response> {

	// Keep in mind that you should override only properties
	// for which you don't like the inherited default values

	override var host: String { return "postman-echo.com" }

	override var path: String { return "/get" }

	override var queryItems: [URLQueryItem] {
		return [URLQueryItem(name: "foo1", value: "bar1"),
		URLQueryItem(name: "foo2", value: "bar2")] }
}
```

where `Response` is:
```swift
struct Response: Codable {
	let args: Argument
	let headers: Headers
	let url: String

	enum CodingKeys: String, CodingKey {
		case args = "args"
		case headers = "headers"
		case url = "url"
	}
}

struct Argument: Codable {...}
struct Headers:  Codable {...}
```

and you call the enpoint like:
```swift
Call { result, error in
	// here result will be of type `Response`
	// error will be of enum case of type `Endpoint.Error` 
}
```

# Installation

### Carthage Installation

1. In your `Cartfile` add `github "stoqn4opm/NetworkingKit"`
2. Link the build framework with the target in your XCode project

For detailed instructions check the official Carthage guides [here](https://github.com/Carthage/Carthage)

### Manual Installation

1. Download the project and build the shared target called `NetworkingKit`
2. Add the product in the list of "embed frameworks" list inside your project's target or create a work space with NetworkingKit and your project and link directly the product of NetworkingKit's target to your target "embed frameworks" list

# Licence

The framework is licensed under MIT licence. For more information see file `LICENCE`

