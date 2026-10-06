import Foundation

extension AgentTabStore {
    /// `name` without control characters, cut to 255 bytes on a character boundary; nil when empty.
    static func displayName(_ name: String) -> String? {
        var result = ""
        for character in name where !character.unicodeScalars.contains(where: { CharacterSet.controlCharacters.contains($0) }) {
            guard result.utf8.count + String(character).utf8.count <= 255 else { break }
            result.append(character)
        }
        let trimmed = result.trimmingCharacters(in: .whitespaces)
        return trimmed.isEmpty ? nil : trimmed
    }
}
