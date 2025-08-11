import SwiftSyntax
import SwiftSyntaxMacros

public struct AutoDescription: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        return [
            """
            var description: String {
                return "\(raw: decl)"
            }
            """
        ]
    }
}