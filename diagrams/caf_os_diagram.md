```mermaid
graph LR
    A[Cafeteria Ordering System]

    subgraph ''
        B[Ordering System]
        B1[FE-1: Order meals from the cafeteria menu for pickup or delivery]
        B2[FE-2: Order meals from local restaurants for delivery]
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
    end

    subgraph ''
        F[Feedback System]
        F1[FE-7: Request and collect feedback from customers]
    end

    A --> B
    A --> C
    A --> D
    A --> E
    A --> F

    B --> B1
    B --> B2

    C --> C1

    D --> D1

    E --> E1
    E --> E2

    F --> F1

