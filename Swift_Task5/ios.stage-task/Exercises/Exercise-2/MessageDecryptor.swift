import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        var levels:[(count: Int, content: String)] = [(1, "")]
        var countStr = ""
        for char in message {
            let s = String(char)
            if  (s == "0") || (s == "1") || (s == "2") || (s == "3") || (s == "4") || (s == "5") || (s == "6") || (s == "7") || (s == "8") || (s == "9") {
                countStr += s
            }
            else if (s == "[") {
                var count = 1
                if countStr != "" {
                    count = Int(countStr)!
                }
                countStr = ""
                levels.append((count, ""))
            }
            else if (s == "]") {
                let lastIndex = levels.count - 1
                for _ in 0..<levels[lastIndex].count {
                    levels[lastIndex - 1].content += levels[lastIndex].content
                }
                levels.removeLast()
            }
            else {
                levels[levels.count - 1].content += s
            }
        }
        return levels[0].content
    }
}
