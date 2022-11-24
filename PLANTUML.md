# PLANTUML

~~~shell
@startuml
skinparam actorStyle awesome
left to right direction

actor Guest as g
package Professional {
    actor Chef as c
    actor "Food Critic" as fc
}

package Restaurant {
    usecase "Eat Food" as UC1
    usecase "Pay for Food" as UC2
    usecase "Drink" as UC3
    usecase "Review" as UC4
}

fc --> UC4
g o--> UC1
g *-- UC2
g <|-- UC3

Class01 <|-- Class02
Class03 *-- Class04
Class05 o-- Class06
Class07 .. Class08
Class09 -- Class10
@enduml
~~~

~~~shell
abstract abstract
abstract class "abstract class"
annotation annotation
circle circle
() circle_short_form
class class
diamond diamond
<> diamond_short_form
entity entity
enum enum
interface interface

~~~

~~~shell
@startuml
class Dummy {
-field1
#field2
~method1()
+method2()
}

class System << (S,#FF7700) Singleton >>
class Date << (D,orchid) >>

scale 750 width
package foo1 <<Node>> {
class Class1
}
package foo2 <<Rectangle>> {
class Class2
}
package foo3 <<Folder>> {
class Class3
}
package foo4 <<Frame>> {
class Class4
}
package foo5 <<Cloud>> {
class Class5
}
package foo6 <<Database>> {
class Class6
}

class System << (S,#FF7700) Singleton >>
class Date << (D,orchid) >>


object firstObject 
object "[AR] My Second Object"  as o2 {
                                      name = "Dummy"
                                      id = 123
                                      }


@enduml
~~~

![image-20221028192313375](.\imagenes\plantUML)
