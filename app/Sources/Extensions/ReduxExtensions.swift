import Redux

protocol Command {
    associatedtype State
    func run(state: () -> State, dispatch: @escaping (Action) -> Void)
}

extension StoreProtocol {
    func dispatch<C: Command>(_ command: C) where C.State == State {
        command.run(state: { self.state }) { action in
            self.dispatch(action)
        }
    }
}
