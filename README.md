NYC Adventure — Database Project (CIS 344)

## Student Information

Name: Mahmoud Mansour
Course: CIS 344 
Professor: Yanilda Peralta Ramos
Semester: Spring 2026

---

Mini World Overview

This project models a database system for an NYC tour company that provides Central Park pedicab and horse carriage tours.

The system supports managing customers, bookings, tour packages, tour guides, languages spoken by guides, landmarks, and tour itineraries.

The purpose of the database is to organize booking operations, assign guides to tours, and define structured tour itineraries.

---

System Requirements

The system must allow:

* Storage of customer information
* Creation and tracking of tour bookings
* Assignment of guides to bookings
* Management of tour packages and pricing
* Representation of landmarks visited during tours
* Definition of tour itineraries
* Tracking languages spoken by guides

Requirements were determined by researching real tour booking platforms and identifying common operational workflows.

---

Entities Included

The database includes the following entities:

* Customers
* Bookings
* Guides
* Guide Languages (junction table)
* Tour Packages
* Landmarks
* Tour Itinerary (junction table)

These entities represent the core operational components of the tour booking system.

---

Relationships Summary

* A customer can create multiple bookings (1:M)
* Each booking is assigned one guide (M:1)
* Each booking selects one tour package (M:1)
* A guide can speak multiple languages (M:N)
* A tour package contains multiple itinerary stops (1:M)
* A landmark can appear in multiple tour packages (M:N via itinerary)

---

## ER Diagrams

This project includes two ER diagram representations:

* Chen Style ER Diagram (hand-drawn)** — conceptual model showing entities, attributes, and relationships
* UML Style ER Diagram (MySQL Workbench)** — logical implementation model

---

## Database Implementation

The database was implemented in MySQL Workbench using forward engineering.

The SQL script includes:

* Database creation
* Table definitions
* Primary keys and foreign keys
* Constraints
* Sample data insertion

---

## Assumptions

* A booking is associated with exactly one customer
* A booking is assigned exactly one guide
* A booking references one tour package
* Guides may speak multiple languages
* Tour packages may include multiple landmarks
* Landmarks can be reused across tour packages
* Stop order defines itinerary sequence

---

## Repository Structure

```text
nyc-tour-database-project/
├── sql/
│   └── nyc_tours.sql
├── diagrams/
│   ├── chen_diagram.jpg
│   └── uml_diagram.png
├── workbench/
│   └── nyc_tours.mwb
├── report/
│   └── final_report.docx
└── README.md
```

---

## Technologies Used

* MySQL Workbench
* SQL (DDL & DML)
* ER Modeling (Chen & UML)
* GitHub

---

## Author

Mahmoud Mansour
Computer Information Systems Student — Lehman College

