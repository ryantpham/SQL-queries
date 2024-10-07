```mermaid
graph LR
    A[Cafeteria Ordering System]

    subgraph ''
        B[Ordering System]
        B1[FE-1: Order meals from the cafeteria menu for pickup or delivery]
        B2[FE-2: Order meals from local restaurants for delivery]
        B3[FE-9: Track order status]
    end

    subgraph ''
        C[Subscription Management]
        C1[FE-3: Create, view, modify, and delete meal service subscriptions]
    end

    subgraph ''
        D[Payment Options]
        D1[FE-4: Register various meal payment methods]
    end

    subgraph ''
        E[Menu and Custom Orders]
        E1[FE-5: Manage cafeteria menus - create, view, modify, delete]
        E2[FE-6: Order custom meals not on the menu]
        E3[FE-10: Manage favorite items.]
    end

    subgraph ''
        F[Feedback System]
        F1[FE-7: Request and collect feedback from customers]
        F2[FE-8:  Contact support.]
    end

    A --> B
    A --> C
    A --> D
    A --> E
    A --> F

    B --> B1
    B --> B2
    B --> B3

    C --> C1

    D --> D1

    E --> E1
    E --> E2
    E --> E3
    
    F --> F1
    F --> F2

