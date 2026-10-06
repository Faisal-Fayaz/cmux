import CmuxNextApps
import CmuxNextSidebar

extension SidebarItemInfo {
    /// How an app item draws: its name and symbol; hidden while the app is
    /// hidden or not active (D55); dimmed when the app is not installed.
    static func app(_ id: String, registry: AppRegistry) -> SidebarItemInfo {
        guard let app = registry.app(id) else { return SidebarItemInfo.fallback(for: .app(id)) }
        let symbol = if case .symbol(let name)? = app.manifest.icon { name } else { "app" }
        // A first-party app keeps its former built-in's short tile caption.
        let caption = SidebarLayoutDocument.firstPartyApps.first { $0.value == id }?.key.caption
        return SidebarItemInfo(title: app.manifest.name.resolved(), symbol: symbol, isMissing: !app.isInstalled,
                               isHidden: AppPresence([app]).suppressed.contains(id), caption: caption)
    }
}
