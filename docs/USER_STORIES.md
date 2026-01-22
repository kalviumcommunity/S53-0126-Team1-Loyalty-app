# SmartLoyalty - User Stories

## Overview

This document contains user stories for the MVP features, organized by user role and priority.

---

## Epic 1: Authentication

### US-1.1: Phone Number Login (Owner)
**As a** shop owner  
**I want to** log in using my phone number and OTP  
**So that** I can securely access my loyalty management dashboard  

**Acceptance Criteria:**
- [ ] User enters 10-digit phone number with country code
- [ ] System sends OTP via SMS within 30 seconds
- [ ] User enters 6-digit OTP
- [ ] Successful verification redirects to role selection (first time) or dashboard
- [ ] Invalid OTP shows error message
- [ ] OTP expires after 60 seconds with resend option

**Story Points:** 5

---

### US-1.2: Phone Number Login (Customer)
**As a** customer  
**I want to** log in using my phone number  
**So that** I can check my loyalty points  

**Acceptance Criteria:**
- [ ] Same flow as owner login
- [ ] After verification, redirects to customer dashboard
- [ ] If phone not registered with any shop, shows "No points yet" message

**Story Points:** 3 (reuses US-1.1 infrastructure)

---

### US-1.3: Role Selection (First-time User)
**As a** first-time user  
**I want to** choose whether I'm a shop owner or customer  
**So that** I see the appropriate interface  

**Acceptance Criteria:**
- [ ] Shows role selection screen after first OTP verification
- [ ] Two clear options: "I'm a Shop Owner" / "I'm a Customer"
- [ ] Owner selection prompts for shop name
- [ ] Customer selection goes directly to dashboard
- [ ] Role is saved and remembered for future logins

**Story Points:** 3

---

## Epic 2: Shop Owner - Customer Management

### US-2.1: Add New Customer
**As a** shop owner  
**I want to** add a new customer by their phone number  
**So that** they can start earning loyalty points  

**Acceptance Criteria:**
- [ ] Input field for customer phone number (10 digits)
- [ ] Optional field for customer name
- [ ] Validates phone number format
- [ ] Shows error if customer already exists
- [ ] Success message with "Add Points" quick action
- [ ] Customer starts with 0 points

**Story Points:** 3

---

### US-2.2: View Customer List
**As a** shop owner  
**I want to** see a list of all my registered customers  
**So that** I can manage my loyalty program  

**Acceptance Criteria:**
- [ ] Displays list sorted by most recent activity
- [ ] Shows: Customer name/phone, current points
- [ ] Search/filter by phone number
- [ ] Tap on customer shows detail view
- [ ] Empty state with "Add your first customer" prompt

**Story Points:** 3

---

### US-2.3: View Customer Details
**As a** shop owner  
**I want to** see details of a specific customer  
**So that** I can award or redeem their points  

**Acceptance Criteria:**
- [ ] Shows customer name/phone
- [ ] Displays current point balance prominently
- [ ] Shows total amount spent (lifetime)
- [ ] Quick action buttons: "Award Points" / "Redeem Points"
- [ ] Shows last 5 transactions (optional for MVP)

**Story Points:** 2

---

## Epic 3: Shop Owner - Points Management

### US-3.1: Award Points to Customer
**As a** shop owner  
**I want to** award points when a customer makes a purchase  
**So that** they are incentivized to return  

**Acceptance Criteria:**
- [ ] Select customer (from list or enter phone)
- [ ] Enter purchase amount in ₹
- [ ] Auto-calculate points (default: ₹10 = 1 point)
- [ ] Option to manually adjust points
- [ ] Confirmation screen showing: Customer, Amount, Points
- [ ] Success message with updated balance
- [ ] Transaction recorded with timestamp

**Story Points:** 5

---

### US-3.2: Approve Point Redemption
**As a** shop owner  
**I want to** approve when a customer redeems points  
**So that** I can give them their reward  

**Acceptance Criteria:**
- [ ] Enter customer phone or select from list
- [ ] Shows current point balance
- [ ] Enter points to redeem
- [ ] Validates: cannot redeem more than available
- [ ] Shows equivalent value (default: 10 points = ₹10 discount)
- [ ] Confirmation with customer acknowledgment
- [ ] Updates balance, records transaction

**Story Points:** 5

---

## Epic 4: Customer Experience

### US-4.1: Check Point Balance
**As a** customer  
**I want to** see my current loyalty points  
**So that** I know how much I've earned  

**Acceptance Criteria:**
- [ ] Dashboard shows current points prominently
- [ ] Shows equivalent redemption value
- [ ] Displays shop name
- [ ] Shows "You're X points away from ₹Y reward" motivation

**Story Points:** 2

---

### US-4.2: Request Point Redemption
**As a** customer  
**I want to** redeem my points for a discount  
**So that** I can get value from my loyalty  

**Acceptance Criteria:**
- [ ] "Redeem" button on dashboard
- [ ] Enter points to redeem (or "Redeem All")
- [ ] Shows equivalent discount value
- [ ] Generates redemption request
- [ ] Message: "Show this to the shop owner"
- [ ] Owner must approve (see US-3.2)

**Story Points:** 3

---

### US-4.3: View Transaction History (Nice-to-have)
**As a** customer  
**I want to** see my points history  
**So that** I can track my earning and spending  

**Acceptance Criteria:**
- [ ] List of transactions (earn/redeem)
- [ ] Shows: Date, Type, Points, Balance after
- [ ] Sorted by most recent first
- [ ] Pagination (10 items per page)

**Story Points:** 3 *(Move to v1.1 if time-constrained)*

---

## Epic 5: Shop Setup

### US-5.1: Create Shop Profile
**As a** new shop owner  
**I want to** set up my shop details  
**So that** customers see my business name  

**Acceptance Criteria:**
- [ ] Prompted after selecting "I'm a Shop Owner"
- [ ] Enter shop name (required)
- [ ] Shop is created and linked to owner phone
- [ ] Redirects to empty dashboard

**Story Points:** 2

---

## Story Map Summary

```
                    │ Must Have (MVP) │ Nice to Have │
────────────────────┼─────────────────┼──────────────│
Authentication      │ US-1.1, 1.2,    │              │
                    │ 1.3             │              │
────────────────────┼─────────────────┼──────────────│
Customer Management │ US-2.1, 2.2,    │              │
                    │ 2.3             │              │
────────────────────┼─────────────────┼──────────────│
Points Management   │ US-3.1, 3.2     │              │
────────────────────┼─────────────────┼──────────────│
Customer Experience │ US-4.1, 4.2     │ US-4.3       │
────────────────────┼─────────────────┼──────────────│
Shop Setup          │ US-5.1          │              │
────────────────────┴─────────────────┴──────────────│
```

---

## Sprint Backlog (Prioritized)

### Sprint 1: Days 1-5 (Foundation)

| ID | Story | Points | Assigned |
|----|-------|--------|----------|
| US-1.1 | Phone Login (Owner) | 5 | Dev 1 |
| US-1.2 | Phone Login (Customer) | 3 | Dev 1 |
| US-1.3 | Role Selection | 3 | Dev 1 |
| US-5.1 | Create Shop Profile | 2 | Dev 2 |
| US-2.1 | Add New Customer | 3 | Dev 2 |
| **Total** | | **16** | |

### Sprint 2: Days 6-10 (Core Features)

| ID | Story | Points | Assigned |
|----|-------|--------|----------|
| US-2.2 | View Customer List | 3 | Dev 1 |
| US-2.3 | View Customer Details | 2 | Dev 1 |
| US-3.1 | Award Points | 5 | Dev 2 |
| US-3.2 | Approve Redemption | 5 | Dev 2 |
| US-4.1 | Check Balance | 2 | Dev 1 |
| US-4.2 | Request Redemption | 3 | Dev 1 |
| **Total** | | **20** | |

---

## Definition of Done

- [ ] Code compiles without errors
- [ ] Feature works on Android emulator
- [ ] Basic error handling implemented
- [ ] Firebase data persists correctly
- [ ] Tested with at least 2 scenarios
- [ ] Code pushed to `mvp` branch

---

## Test Scenarios (MVP)

### Scenario 1: New Shop Owner Onboarding
1. Open app → Splash → Login screen
2. Enter phone: +91 98765 43210
3. Receive OTP, enter code
4. Select "I'm a Shop Owner"
5. Enter shop name: "Sharma General Store"
6. Land on empty owner dashboard

### Scenario 2: Add Customer and Award Points
1. Owner clicks "Add Customer"
2. Enters phone: +91 91234 56789, name: "Priya"
3. Customer added successfully
4. Clicks "Award Points"
5. Enters purchase: ₹500
6. Points calculated: 50
7. Confirms → Customer now has 50 points

### Scenario 3: Customer Checks Balance
1. Customer opens app
2. Logs in with phone: +91 91234 56789
3. Sees dashboard: "You have 50 points"
4. Shows: "Worth ₹50 in discounts"

### Scenario 4: Point Redemption
1. Customer clicks "Redeem"
2. Enters 30 points to redeem
3. Shows: "₹30 discount - Show to shop owner"
4. Shop owner opens customer detail
5. Clicks "Redeem Points" → enters 30
6. Confirms → Customer balance: 20 points

---

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Flutter learning curve | High | High | Use official tutorials, simple UI |
| Firebase OTP costs | Low | Medium | Free tier: 10K/month, sufficient for demo |
| Time overrun | Medium | High | Cut US-4.3, focus on core flow |
| Device testing issues | Medium | Medium | Test on 2-3 real devices early |
