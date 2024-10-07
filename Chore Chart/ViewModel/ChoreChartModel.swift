//
//  ChoreChartModel.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
import Foundation
import FirebaseFirestore

class ChoreChartModel: ObservableObject {
    @Published var children: [Child] = []
    @Published var events: [Event] = []
    let db = Firestore.firestore()
    
    //MARK: Add data to database and array
    func addChild (child: Child) {
        do {
            let newChild = try db.collection("Child").addDocument(from: child)
            children.append(child)
        } catch {
            print("Error adding document: \(error)")
        }
    }
    
    func addEvent (event: Event) {
        do {
            let ref = try db.collection("Event").addDocument(from: event)
            events.append(event)
        } catch {
            print("Error adding document: \(error)")
        }
    }
    
    //MARK: Delete data from database
    func deleteChild (child: Child) async {
        do {
            try await db.collection("Child").document("child").delete()
            
            //Reread Child collection
            await readChildren()
            
        } catch {
            print("Error removing document: \(error)")
        }
    }
    
    func deleteEvent (event: Event) async {
        do {
            try await db.collection("Event").document("event").delete()
            
            //Reread Child collection
            await readEvents()
            
        } catch {
            print("Error removing document: \(error)")
        }
    }
    
    //MARK: Modify data in the database
    func modifyChild (child: Child) {
        if let id = child.id {
            let currentChild = db.collection("Child").document(id)
            do {
                try currentChild.setData(from: child)
            }
            catch {
                print(error)
            }
        }
    }
    
    func modifyEvent (event: Event) {
        if let id = event.id {
            let currentEvent = db.collection("Event").document(id)
            do {
                try currentEvent.setData(from: event)
            }
            catch {
                print(error)
            }
        }
    }
    
    //Add an event to the child events array
    func addChildEvent(child: Child, event: Event) {
        child.events.append(event)
        modifyChild(child: child)
    }
    
    func deleteChildEvent(child: Child, event: Event) {
        //Get index of event
        var index = 0
        for event1 in child.events {
            if event1 === event {
                break
            } else {
                index += 1
            }
        }
        
        //Remove the event
        child.events.remove(at: index)
        modifyChild(child: child)
    }
    
    //MARK: Read data from database to arrays
    func readChildren() async {
        
        //Set children array to empty
        children = []
        
        do {
            let snapshot = try await db.collection("Child").getDocuments()
            for document in snapshot.documents {
                
                //Set each document to a child object
                let newChild = try document.data(as: Child.self)
                
                //Append to the children array
                children.append(newChild)
            }
        } catch {
            print("Error getting documents: \(error)")
        }
    }
    
    func readEvents() async {
        
        //Set children array to empty
        events = []
        
        do {
            let snapshot = try await db.collection("Event").getDocuments()
            for document in snapshot.documents {
                
                //Set each document to a child object
                let newEvent = try document.data(as: Event.self)
                
                //Append to the children array
                events.append(newEvent)
            }
        } catch {
            print("Error getting documents: \(error)")
        }
    }
}
