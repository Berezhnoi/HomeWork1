import UIKit

enum TranslationKey: String {
    case hello
    case goodbye
    case work
    case yes
    case my
    case friend
}

class I18n {
    func translate(_ key: TranslationKey) -> String {
        fatalError("This method must be overridden")
    }
}

class GermanI18n: I18n {
    override func translate(_ key: TranslationKey) -> String {
        switch key {
        case .hello:
            return "Hallo"
        case .goodbye:
            return "Auf Wiedersehen"
        case .work:
            return "Arbeit"
        case .yes:
            return "Ja"
        case .my:
            return "mein" // German translation for "my"
        case .friend:
            return "Freund" // German translation for "friend"
        }
    }
}

class EnglishI18n: I18n {
    override func translate(_ key: TranslationKey) -> String {
        switch key {
        case .hello:
            return "Hello"
        case .goodbye:
            return "Goodbye"
        case .work:
            return "Work"
        case .yes:
            return "Yes"
        case .my:
            return "my"
        case .friend:
            return "friend"
        }
    }
}

class UkrainianI18n: I18n {
    override func translate(_ key: TranslationKey) -> String {
        switch key {
        case .hello:
            return "Привіт"
        case .goodbye:
            return "До побачення"
        case .work:
            return "Робота"
        case .yes:
            return "Так"
        case .my:
            return "мій" // Ukrainian translation for "my"
        case .friend:
            return "друг" // Ukrainian translation for "friend"
        }
    }
}

enum Language {
    case english
    case german
    case ukrainian
}

class Translator {
    var languageI18nMap: [Language: I18n]
    var currentLanguage: Language
    
    init(languageI18nMap: [Language: I18n], currentLanguage: Language) {
        self.languageI18nMap = languageI18nMap
        self.currentLanguage = currentLanguage
    }
    
    func translate(_ key: TranslationKey) -> String {
        guard let i18n = languageI18nMap[currentLanguage] else {
            return "No translation available for the current language"
        }
        return i18n.translate(key)
    }
    
    func changeLanguage(to newLanguage: Language) {
        guard languageI18nMap.keys.contains(newLanguage) else {
            print("Invalid language provided.")
            return
        }
        currentLanguage = newLanguage
    }
}

// Example usage
let englishI18n = EnglishI18n()
let germanI18n = GermanI18n()
let ukrainianI18n = UkrainianI18n()

let languageI18nMap: [Language: I18n] = [.english: englishI18n, .german: germanI18n, .ukrainian: ukrainianI18n]

let translator = Translator(languageI18nMap: languageI18nMap, currentLanguage: .english)

// Translate some text
print("\(translator.translate(.hello)) \(translator.translate(.my)) \(translator.translate(.friend))") // Output: Hello my friend

// Change language to Ukrainian
translator.changeLanguage(to: .ukrainian)

// Translate again
print("\(translator.translate(.hello)) \(translator.translate(.my)) \(translator.translate(.friend))") // Output: Привіт мій друг

// Change language to German
translator.changeLanguage(to: .german)

// Translate again
print("\(translator.translate(.hello)) \(translator.translate(.my)) \(translator.translate(.friend))") // Output: Hallo mein Freund

