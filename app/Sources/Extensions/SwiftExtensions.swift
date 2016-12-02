extension Dictionary {
    func merge(with rhs: Dictionary) -> Dictionary {
        var copy = self
        for (key, value) in rhs {
            copy[key] = value
        }
        return copy
    }
}
