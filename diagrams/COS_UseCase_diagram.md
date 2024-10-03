```mermaid
flowchart LR
    A[Customer] --> B[Cafeteria Ordering System]
    B --> OrderProcess
    OrderProcess --> FulfillmentProcess
    FulfillmentProcess --> M[Provide Feedback]

    subgraph OrderProcess[Order Process]
        direction TB
        C{Select Service}
        C -->|Delivery| D[Choose Location]
        C -->|Pickup| E[Choose Pickup Time]
        D & E --> F[Browse Menu]
        F --> G[Place Order]
        G --> H[Process Payment]
    end

    subgraph FulfillmentProcess[Fulfillment Process]
        direction TB
        I{Delivery?}
        I -->|Yes| J[Deliver to Location]
        I -->|No| K[Prepare for Pickup]
        J & K --> L[Receive Order]
    end
