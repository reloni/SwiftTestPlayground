import Foundation

struct EventHandler<T> {
    typealias Worker = (T) -> Void
    
    let handle: Worker
}

extension EventHandler where T == DBEvent {
    static func dbHandler(_ driver: DBDriver) -> EventHandler<T> {
        .init(handle: handleDBEvent(driver))
    }
}

enum DBEvent {
    case read
    case write
    case update
    case delete
}

protocol DBDriver {
    func read()
    func write()
    func update()
    func delete()
}

func handleDBEvent(_ driver: DBDriver) -> (DBEvent) -> () {
    return { event in
        switch event {
        case .delete: driver.delete()
        case .read: driver.read()
        case .update: driver.update()
        case .write: driver.write()
        }
    }
}

class DBProcessWorker {
    let eventHandler: EventHandler<DBEvent>
    
    init(_ handler: EventHandler<DBEvent>) {
        self.eventHandler = handler
    }
    
    func doWork() {
        eventHandler.handle(.read)
    }
}
