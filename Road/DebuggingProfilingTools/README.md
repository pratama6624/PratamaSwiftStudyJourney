[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - Debugging & Profiling Tools

### Xcode Debugger (LLDB) — basic → advanced
	[ ] Breakpoints: regular, conditional, symbolic (objc_exception_throw), exception breakpoint (All Exceptions)
	[ ] Breakpoint actions: log message, run script, auto-continue
	[ ] Step controls: step in/over/out, continue, pause
	[ ] LLDB commands: po, p, frame variable, expression -l Swift -- <expr>
	[ ] Watchpoints (memory read/write)
	[ ] Thread control & thread selection, suspend/resume threads
	[ ] Attach to process vs launch from Xcode

### View & UI Debugging
	[ ] Debug View Hierarchy (capture view tree, 3D, frames, constraints)
	[ ] Inspect Auto Layout constraint conflicts & ambiguous layout
	[ ] Color Blended Layers / Color Offscreen-Rendered (repaint issues)
	[ ] View-specific debug hacks for SwiftUI: use Xcode Previews, .border(), .background(Color.red.opacity(0.2)), and run on device to inspect real rendering
	[ ] Accessibility inspector & VoiceOver testing

### Memory Debugging
	[ ] Memory Graph Debugger (detect retain cycles, strong refs)
	[ ] Instruments: Allocations, Leaks, VM Tracker, Heap shots
	[ ] Enable runtime tools: Zombies, Malloc Scribble, Guard Malloc
	[ ] Address Sanitizer (ASan) — detect memory corruption
	[ ] Thread Sanitizer (TSan) — detect data races
	[ ] Undefined Behavior Sanitizer (UBSan) if needed

### Performance Profiling
	[ ] Instruments: Time Profiler (CPU sampling), System Trace, Core Animation, Energy Log, Points of Interest (signposts)
	[ ] Main Thread Checker (find UI work on main thread)
	[ ] Measure hot paths & frame drops; identify expensive funcs in Time Profiler
	[ ] Core Animation instrument: layer, render, compositing bottlenecks
	[ ] CPU/GPU contention analysis (Metal GPU Frame Capture / Metal System Trace)

### Networking Debugging & Profiling
	[ ] Instruments Network instrument / URLSession task metrics
	[ ] Use Network Link Conditioner (simulate poor networks)
	[ ] Use proxy tools (Proxyman/Charles) for request/response inspection (optional external tools)
	[ ] Log request/response timing + use os_signpost for network timing

### Crash Reporting & Symbolication
	[ ] Add Exception Breakpoint to catch early crashes
	[ ] Collect crash logs (Devices & Simulators → View Device Logs / Xcode Organizer)
	[ ] dSYMs: archive & upload to crash service (Crashlytics, Sentry) for symbolication
	[ ] Reproduce crash with debugger; use backtrace (thread backtrace all)
	[ ] Use symbolicatecrash or Xcode Organizer to symbolicate

### Logging & Tracing
	[ ] Use Logger (OSLog) / os_signpost for structured logs & performance signposts
	[ ] Avoid spammy print() in production; use levels & privacy markers
	[ ] Correlate logs with signpost intervals in Instruments
	[ ] Console.app & device logs for runtime system messages

### Core Data & Persistence Debugging
	[ ] Instruments Core Data template (fetch/ save profiling)
	[ ] Use SQL debug flags (-com.apple.CoreData.SQLDebug 1) for SQL output (scheme env vars)
	[ ] Inspect migrations & lightweight migration failures
	[ ] Test fetch performance; optimize indexes and predicates

### Graphics / Metal Debugging
	[ ] Metal Frame Capture, Metal System Trace
	[ ] GPU Counters & shader profiling
	[ ] Validate Metal API usage via Metal API Validation

### Energy & Battery
	[ ] Instruments Energy Log to find battery heavy tasks
	[ ] Use MetricKit (on-device aggregated metrics) for real-world energy/crash metrics

### Sanitizers & Runtime Checks (enable in Scheme)
	[ ] Address Sanitizer (ASan)
	[ ] Thread Sanitizer (TSan)
	[ ] Undefined Behavior Sanitizer (UBSan)
	[ ] Enable in Xcode Scheme for debug/test builds

### Automated Testing & Profiling Integration
	[ ] Use measure { } in XCTest for performance tests
	[ ] Integrate Instruments traces into CI if needed (trace collection on device)
	[ ] Capture metrics via MetricKit & upload to CI/monitor

### Device-Specific Debugging
	[ ] Device Console & sysdiagnose for low-level logs
    [ ] Use “Capture GPU Frame” on device for rendering bugs
	[ ] Test background/foreground transitions & background tasks on device

### Workflow & Best Practices (don’t skip)
	[ ] Reproduce reliably → minimize test case → isolate root cause
	[ ] Use signposts to mark start/end of important operations
	[ ] Keep debug builds with symbols; upload dSYMs for release crash reports
	[ ] Strip sensitive logs from production builds; keep structured logging
	[ ] Automate periodic profiling of heavy flows (e.g., onboarding, feed load)
	[ ] Correlate logs + traces + crash reports to build full story

### Tools & Contacts (quick list)
	[ ] Xcode Debugger (LLDB)
	[ ] Instruments (Time Profiler, Allocations, Leaks, Core Animation, Network, Energy, Metal)
	[ ] Console.app & Device Logs
	[ ] MetricKit (production metrics)
	[ ] OSLog / Logger / os_signpost
	[ ] Crash services: Firebase Crashlytics / Sentry / Bugsnag (choose one)
	[ ] Network Link Conditioner, Proxyman/Charles (optional but recommended)