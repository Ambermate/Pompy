

import Foundation
import SwiftUI

struct TestItem: Codable {
    var sometext: String
}
    
func post(to urlString: String = "https://3dc0-65-112-8-20.ngrok.io/test_post", _ data: TestItem, name: Binding<String>, cal: Binding<String>) {
    guard let url = URL(string: urlString) else{return}
    
    do {
        let data = try? JSONEncoder().encode(data)
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // based on this, it seems to work
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            let raw = String(data: data!, encoding: .utf8)!
            let arr = raw.components(separatedBy: " ")
            name.wrappedValue = String(arr[1][arr[1].index(arr[1].startIndex, offsetBy: 1)..<arr[1].index(arr[1].endIndex, offsetBy: -1)])
            cal.wrappedValue = String(arr[2][..<arr[2].index(arr[2].endIndex, offsetBy: -2)])

            print(String(data: data!, encoding: .utf8)!)
            print(response ?? "no")
            print(error ?? "none")
            
            // change the state
            
            
        }
        task.resume()
    }
    
}

//post(to: "https://3dc0-65-112-8-20.ngrok.io/test_post", TestItem(sometext: "https://www.dropbox.com/s/swk13j8d44ohwgg/IMG_7441.jpg?dl=1"))
