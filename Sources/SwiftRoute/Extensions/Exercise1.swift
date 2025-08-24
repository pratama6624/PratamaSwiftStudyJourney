extension String {
    func formattedPhoneNumber() -> String {
        let digits = self.filter { $0.isNumber }

        guard digits.count >= 10 && digits.count <= 13 else { return self }

        let prefix = digits.prefix(4)
        let middle = digits.dropFirst(4).prefix(4)
        let last = digits.suffix(digits.count - 8)
        
        return "\(prefix)-\(middle)-\(last)"
    }
}

let rawNumber = "081234556789"
print(rawNumber.formattedPhoneNumber())