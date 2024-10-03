```mermaid
flowchart TD
    A[Customer] --> B[COS]
    B --> C{Select Service}
    C -->|Delivery| D[Choose Location]
    C -->|Pickup| E[Choose Pickup Time]
    D --> F[Browse Menu]
    E --> F
    F --> G[Place Order]
    G --> H[Process Payment]
    H --> I{Delivery?}
    I -->|Yes| J[Deliver to Location]
    I -->|No| K[Prepare for Pickup]
    J --> L[Receive Order]
    K --> L
    L --> M[Provide Feedback]
