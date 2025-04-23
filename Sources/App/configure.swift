import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor
import DotEnv

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // Cara lama
    // globalConfig = AppConfig(appName: "SwiftyApp", version: "1.0")
    
    // Cara baru di swift 6
    app.config = AppConfig(appName: "SwiftyApp", version: "1.0")
    
    app.logger.logLevel = .debug
    
    // Load env file
    try DotEnv.load(path: app.directory.workingDirectory + ".env")

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)

    app.migrations.add(CreateBasic())
    // register routes
    try routes(app)
}
