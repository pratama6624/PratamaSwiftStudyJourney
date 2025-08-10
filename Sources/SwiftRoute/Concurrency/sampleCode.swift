// Concurrency + Export CSV

import Foundation

// MARK: - Helpers untuk info thread
func currentThreadIDs() -> (pthreadID: UInt64, machThread: UInt32) {
    var pthreadId: UInt64 = 0
    pthread_threadid_np(nil, &pthreadId) // pthread id (user-level)
    let machThread = pthread_mach_thread_np(pthread_self()) // mach thread port (kernel identifier)
    return (pthreadId, machThread)
}

func logicalCPUCount() -> Int {
    var cpuCount: Int = 0
    var size = MemoryLayout<Int>.size
    let name = "hw.logicalcpu"
    name.withCString { cName in
        sysctlbyname(cName, &cpuCount, &size, nil, 0)
    }
    return cpuCount
}

// Struct buat simpan data log ke CSV
struct TaskLog {
    let taskNumber: Int
    let pthreadBefore: UInt64
    let machBefore: UInt32
    let pthreadAfter: UInt64
    let machAfter: UInt32
    let moved: Bool
    let sleepMs: UInt64
}

@main
struct InspectConcurrency {
    static func main() async {
        let n = 50
        print("⇒ Mengeksekusi \(n) tasks concurrently")
        print("⇒ Logical CPU count: \(logicalCPUCount())")
        print("-------------------------------------------------\n")

        let start = Date()
        var logs = [TaskLog]() // untuk CSV

        // Pakai actor untuk isolasi data logs
        actor LogCollector {
            var items = [TaskLog]()
            func append(_ log: TaskLog) {
                items.append(log)
            }
            func getLogs() -> [TaskLog] { items }
        }
        let collector = LogCollector()

        await withTaskGroup(of: Void.self) { group in
            for i in 1...n {
                group.addTask {
                    let before = currentThreadIDs()
                    print("[Task \(i)] start | pthread:\(before.pthreadID) | mach:\(before.machThread)")

                    let sleepMs = UInt64(Int.random(in: 100...1200))
                    try? await Task.sleep(nanoseconds: sleepMs * 1_000_000)

                    let after = currentThreadIDs()
                    let moved = before.pthreadID != after.pthreadID

                    if moved {
                        print("[Task \(i)] after  | pthread:\(after.pthreadID) (MOVED) | mach:\(after.machThread)")
                    } else {
                        print("[Task \(i)] after  | pthread:\(after.pthreadID) (SAME)  | mach:\(after.machThread)")
                    }

                    // Simpan log ke collector
                    await collector.append(TaskLog(
                        taskNumber: i,
                        pthreadBefore: before.pthreadID,
                        machBefore: before.machThread,
                        pthreadAfter: after.pthreadID,
                        machAfter: after.machThread,
                        moved: moved,
                        sleepMs: sleepMs
                    ))

                    print("[Task \(i)] done\n")
                }
            }
        }

        let elapsed = Date().timeIntervalSince(start)
        print("-------------------------------------------------")
        print("Semua tasks selesai dalam \(String(format: "%.3f", elapsed)) detik")

        // Ambil semua log
        let finalLogs = await collector.getLogs()

        // Export ke CSV
        let csvHeader = "TaskNumber,PthreadBefore,MachBefore,PthreadAfter,MachAfter,Moved,SleepMs\n"
        let csvRows = finalLogs.sorted { $0.taskNumber < $1.taskNumber }.map { log in
            "\(log.taskNumber),\(log.pthreadBefore),\(log.machBefore),\(log.pthreadAfter),\(log.machAfter),\(log.moved),\(log.sleepMs)"
        }.joined(separator: "\n")

        let csvContent = csvHeader + csvRows
        let fileURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .appendingPathComponent("thread_logs.csv")

        do {
            try csvContent.write(to: fileURL, atomically: true, encoding: .utf8)
            print("CSV berhasil dibuat di: \(fileURL.path)")
        } catch {
            print("Gagal membuat CSV: \(error)")
        }
    }
}