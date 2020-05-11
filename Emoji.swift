
import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var detailDescription: String
    var usage: String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emoji").appendingPathExtension("plist")
   
    static func loadSampleEmojis() -> [Emoji] {
       return [Emoji(symbol: "😄", name: "Grinning Face", detailDescription: "A typical Smiley Face", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", detailDescription: "A confused, puzzled face", usage: "happiness"),
        Emoji(symbol: "😍", name: "Heart Eyes", detailDescription: "A smiley face with hearts for eyes", usage: "Love of something attractive"),
        Emoji(symbol: "👮‍♀️ ", name: "Police Officer", detailDescription: "A police officer wearing a blue witha gold badge. He is smiling and egar to help", usage: "Persin of authority"),
        Emoji(symbol: "🐢", name: "Turtle", detailDescription: "A cute turtle", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", detailDescription: "A grey Elephant", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spagetti", detailDescription: "A plate of spagetti", usage: "spagetti"),
        Emoji(symbol: "🎲", name: "Die", detailDescription: "A single Die", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", detailDescription: "A small tent", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", detailDescription: "Three colored books stacked on top of each other", usage: "homework, studdying"),
        Emoji(symbol: "💔", name: "Broken Heart", detailDescription: "Three blue z's", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkerd Flag", detailDescription: "A black and white checkerd flag", usage: "completion")]
        
    }
    
    
    
    
    
    static func loadFromFile() -> [Emoji]? {
        guard let codedEmojis = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Emoji>.self, from: codedEmojis)
    }


    static func saveToFile(emohis: [Emoji]) {
        let encoder = PropertyListEncoder()
        let codedEmojis = try? encoder.encode(emoji)
        try? codedEmojis?.write(to: ArchiveURL, options: .noFileProtection)
    }



}
