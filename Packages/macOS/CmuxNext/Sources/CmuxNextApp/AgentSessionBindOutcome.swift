/// What the store answered a session bind.
enum AgentSessionBindOutcome: Equatable {
    case taken
    /// Another device changed the tab's chat first (`conversation_tab.session_conflict`).
    case conflict
    /// The bind did not reach the store or failed otherwise.
    case failed
}
