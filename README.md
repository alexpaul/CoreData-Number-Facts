# CoreData-Number-Facts

This app uses Core Data as its persistence API. 

There are two models in the Core Data schema namely, a User and Post entity. 

Core Data is an object graph not a database. 

## 1. Vocabulary 

1. Entity - core data objects (classes)
1. Attributes - class properties
1. Relationships - connections between entities
1. NSManagedObject - classes in Core Data inherit from NSManagedObject
1. NSManagedObjectContext - the context is needed to commit any change to the persistence store
1. NSPersistenceContainer - mangages NSManagedObjectContext's
1. NSPredicate 
1. NSSortDescriptor


## 2. Accessing the context from the AppDelegate 

```swift
private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
```

## 3. Fetching from the managed context 

```swift 
do {
  modelObjects = try context.fetch(Model.fetchRequest()) // all data
} catch {
  // error
}
```

## 4. Saving a new model to the NSManagedObjectContext

Sample code for adding a new model object (record) to Core Data 

```swift 
let model = Model(entity: Model.entity(), insertInto: context)
model.propertyName = someData 
appDelegate.saveContext()  // save the new model object to the managed object content
// update your collection ui as needed 
```

## 5. Available types 

1. Undefined 
1. Integer 16
1. Integer 32
1. Integer 64
1. Decimal 
1. Double 
1. Float 
1. String 
1. Boolean
1. Date
1. Boolean
1. Date 
1. Binary Data (NSData) 
1. UUID 
1. URI 
1. Transformable (NSObject -> NSData)
