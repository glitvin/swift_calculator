import Foundation

class ThemeManager {
    
    // MARK: - Singleton
    
    static let shared = ThemeManager()
    
    // MARK: - Data Storage
    
    private var dataStore = DataStoreManager(key: ThemeManager.Constants.dataStoreKey)
    
    // MARK: - Themes
    
    private var savedThemeIndex = 0
    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }
        
        return savedTheme
    }
    
    // MARK: - Lifecycle
    
    init() {
        populateArrayOfThemes()
        restoreSavedTheme()
    }
    
    private func populateArrayOfThemes() {
        themes = [darkTheme, bloodOrangeTheme, darkBlueTheme, electroTheme, lightBlueTheme, lightTheme, orangeTheme, pinkTheme, purpleTheme, washedOutTheme]
    }
    
    // MARK: - Save & Restore to Disk
    
    private func restoreSavedTheme() {
        guard let encodedTheme = dataStore.getValue() as? Data else {
            return
        }
        
        let decoder = JSONDecoder()
        if let previousTheme = try? decoder.decode(CalculatorTheme.self, from: encodedTheme) {
            savedTheme = previousTheme
        }
    }
    
    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        if let encodedTheme = try? encoder.encode(theme) {
            dataStore.set(encodedTheme)
        }
        
        
    }
    
    // MARK: - Next Theme
    
    func moveToNextTheme() {
        
        let currentThemeID = currentTheme.id
        let index: Int? = themes.firstIndex {
            CalculatorTheme in CalculatorTheme.id == currentThemeID
        }
        
        guard let indexOfExistingTheme = index else {
            if let firstTheme = themes.first {
                updateSystemWithTheme(firstTheme)
            }
            return
        }

        var nextThemeIndex = indexOfExistingTheme + 1
        if nextThemeIndex > themes.count - 1 {
            nextThemeIndex = 0
        }
        
        let theme = themes[nextThemeIndex]
        updateSystemWithTheme(theme)
        
    }
    
    private func updateSystemWithTheme(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveThemeToDisk(theme)

    }
    
}


