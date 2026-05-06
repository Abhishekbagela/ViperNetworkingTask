# Highly Scalable iOS Architecture Roadmap

This document breaks down the process of upgrading a standard VIPER app into a highly scalable, enterprise-grade application. Each phase is written as a "User Story" with specific actionable tasks and the core concepts you will learn.

---

## 📖 Story 1: Decouple Domain Entities from Network Responses (DTOs)

**Objective:** API contracts change constantly. If the backend changes a key name, it shouldn't break our SwiftUI Views. We need to separate what the network returns (Data Transfer Objects - DTOs) from what the App actually uses (Domain Entities).

**Tasks (Acceptance Criteria):**
- [ ] Create a `Network/DTO/` folder.
- [ ] Move `ProductResponse` into the DTO folder and rename the structs to things like `ProductDTO`.
- [ ] Create a pure `Product` domain model in the `Entity/` folder (without Codable, just the properties the View needs).
- [ ] Write a "Mapper" (e.g., `ProductMapper`) inside the Interactor or a dedicated mapping layer that converts `ProductDTO` -> `Product`.

**🧠 Concepts to Learn:**
- Data Transfer Objects (DTOs)
- Domain-Driven Design (Domain Models)
- The Mapper/Translator Pattern

---

## 📖 Story 2: Implement "Use Cases" to Prevent Massive Interactors

**Objective:** As features grow, Interactors become massive files holding all business rules (fetching, saving to DB, analytics). We want to break business rules down into single-responsibility "Use Cases".

**Tasks (Acceptance Criteria):**
- [ ] Create a `Domain/UseCases/` folder inside the `Product List` and `Product Details` modules.
- [ ] Create a `FetchProductListUseCase` protocol and class. Move the network fetching logic from `ProductListInteractor` into this Use Case.
- [ ] Update the `ProductListInteractor` so it takes `FetchProductListUseCase` as a dependency instead of `NetworkManager`.
- [ ] Do the same for `FetchProductDetailsUseCase`.

**🧠 Concepts to Learn:**
- Clean Architecture (Use Case / Interactor layers)
- Single Responsibility Principle (SRP)
- Dependency Inversion Principle (DIP)

---

## 📖 Story 3: Decentralize Routing (The Coordinator Pattern)

**Objective:** `AppRouter` currently handles every single destination in the app. In a 50+ screen app, this becomes a massive "God Class". We need feature-specific routers that can hand off control to each other.

**Tasks (Acceptance Criteria):**
- [ ] Rename `AppRouter` to `AppCoordinator`.
- [ ] Create a `ProductListCoordinator` and a `ProductDetailsCoordinator`.
- [ ] The `AppCoordinator` should start the `ProductListCoordinator`.
- [ ] When a product is tapped, `ProductListCoordinator` should instantiate and delegate to `ProductDetailsCoordinator`.
- [ ] (SwiftUI Specific) Figure out how to manage `NavigationStack` path arrays across different coordinators.

**🧠 Concepts to Learn:**
- The Coordinator Pattern (by Soroush Khanlou)
- Flow Controllers
- Scalable Navigation in SwiftUI (`NavigationPath`)

---

## 📖 Story 4: Build a Reusable Design System

**Objective:** The app currently has reusable views (`RatingView`, `ProductImagesTabView`, `AsyncImageDownloader`) trapped inside `ProductDetailsView.swift`. An enterprise app has a strict, centralized UI library.

**Tasks (Acceptance Criteria):**
- [ ] Create a `UIComponents/` or `DesignSystem/` root folder.
- [ ] Move all shared views (`RatingView`, etc.) into this folder as separate files.
- [ ] Create a `Theme.swift` file to centralize colors, typography, and spacing (e.g., `Theme.Colors.primary`, `Theme.Spacing.small`).
- [ ] Update all views to use the centralized `Theme` rather than hardcoded `.padding()` or `.gray`.

**🧠 Concepts to Learn:**
- Atomic Design Principles
- UI/UX Design Systems
- View Modifiers in SwiftUI

---

## 📖 Story 5: Scalable Network Layer & Error Handling

**Objective:** The current `NetworkManager` is good, but it hardcodes `GET` requests and doesn't handle varied HTTP methods, headers, or robust error states well.

**Tasks (Acceptance Criteria):**
- [ ] Create an `Endpoint` protocol that defines `path`, `method` (GET/POST), `headers`, and `body`.
- [ ] Convert `APIUrl` into proper structs/enums conforming to `Endpoint`.
- [ ] Update `NetworkManager` to accept an `Endpoint` instead of just a URL string.
- [ ] Implement a standardized `AppError` mapping so network errors are translated into user-friendly domain errors (e.g., `NetworkError.noInternet` -> "Please check your connection").

**🧠 Concepts to Learn:**
- Router/Endpoint Pattern in Networking (similar to Moya)
- HTTP Protocol (Headers, Body, Status Codes)
- Centralized Error Handling

---

### How to use this guide:
Pick **Story 1**, create a git branch (e.g., `feature/decouple-dtos`), make the changes, and test the app. Once it works, merge it and move to the next!
