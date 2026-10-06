import CmuxNextDaemon

/// A store-committed agent chat tab: its tab id (`TabModel.id`) and surface.
struct AgentTabCreated: Sendable, Equatable {
    var key: String
    var surface: SurfaceID
}
