# Sodanaraga | Point of Sale & Thermal Billing System

A modern, fast, mobile-first Point of Sale (POS) and Restaurant Billing Web Application built for **"Sodanaraga"** (Restaurant & Food Fest). It is 100% self-contained in a single file (`index.html`), stores all data locally (`localStorage`), and provides direct dual-printing support for mobile and desktop thermal printers.

---

## 🌟 Key Features

### 1. 📱 Mobile-First Touch UI (Phones & Tablets)
- **Fluid Layout**: Optimized for iOS Safari and Android Chrome with accessible tap targets (44px+), safe-area insets, and smooth CSS transitions.
- **Persistent Floating Cart Bar**: Floats cleanly at the bottom on mobile screens, displaying live item count and total ₹ amount; one tap slides open the checkout drawer.
- **Desktop / Tablet Split View**: On wider screens, automatically transitions to a side-by-side POS interface (Menu Grid on the left, Live Order & Billing Panel on the right).
- **Audio Feedback**: Built-in sound synthesizer using the Web Audio API (zero external sound files) providing subtle, pleasant tap beeps and checkout chimes.

### 2. 🍛 Daily Menu Management (Phone-Friendly Admin)
- **Drawer / Modal Editor**: Add, modify, or delete dishes directly from your phone.
- **Camera & Gallery Photo Upload**: Take dish photos directly using your smartphone camera (`capture="environment"`) or select from gallery. Photos are automatically compressed on an HTML5 Canvas down to ~20KB and stored as Base64 strings in `localStorage`.
- **External Image URL**: Alternative option to paste any image link.
- **Instant Stock Toggle**: Easily toggle items between **In Stock** and **Out of Stock** with one tap. Out-of-stock items automatically dim on the POS screen with "+ Add" disabled.
- **Default Seed Dishes**: Comes pre-loaded with realistic restaurant items (Dum Biryani, Paneer Butter Masala, Chicken Tikka, Crispy Corn, Garlic Naan, Mango Lassi, Gulab Jamun).

### 3. 🛒 POS & Order Taking Workflow
- **Category Filter Pills**: Quick filters for *All Items*, *Starters*, *Mains*, *Breads*, *Beverages*, and *Desserts*.
- **Live Search**: Instant keyword search for dishes.
- **Order Counter Badges**: Live counters directly on dish cards showing how many of each item are currently in the cart.
- **Custom Adjustments**:
  - Quantity controls (`+` / `−` / Remove).
  - Quick discount chips (`0%`, `5%`, `10%`, `15%`, and Custom `%`).
  - Tax toggle: Standard 5% GST (CGST 2.5% + SGST 2.5%) with automatic calculation.
  - Round-off calculation for clean cash change.
  - Table selection (Table 1–5 or Takeaway) and optional customer details.
  - Payment mode selector (Cash, UPI / QR, Card).

### 4. 🖨️ Dual Thermal Printer Connectivity

#### Method A: Direct Bluetooth Thermal Printer (Web Bluetooth API)
- Connects directly to 58mm or 80mm Bluetooth mini-printers using `navigator.bluetooth`.
- Supports standard Bluetooth thermal printer GATT services (`0x18F0`, `0xFF00`, `49535343-...`, etc.).
- Encodes raw **ESC/POS** byte streams:
  - Center & bold header: **SODANARAGA**
  - Itemized tabular formatting with column spacing (32 cols for 58mm, 48 cols for 80mm).
  - Subtotal, Discount, Tax breakdown, Grand Total, and Footer.
  - Paper feed and automatic cut command.
- BLE chunking (100-byte packets) to prevent buffer overflows on portable mini-printers.
- **Automatic Fallback**: If Web Bluetooth is unavailable (e.g., iOS Safari) or printer disconnects, seamlessly opens the native system print dialog.

#### Method B: System & Wi-Fi / Cloud Print (`window.print()`)
- Formatted with dedicated CSS `@media print` rules.
- Hides all buttons, navigation bars, headers, and backgrounds.
- Compatible with iOS AirPrint, Android Default Print Service, OTG USB, and Wi-Fi network receipt printers.
- Supports instant width switching between **58mm (Mobile Mini)** and **80mm (Desktop Thermal)**.

---

## 🚀 How to Run

1. Open `index.html` directly in any modern mobile or desktop web browser (Google Chrome, Microsoft Edge, Safari).
2. No Node.js, build step, or server installation is required.
3. For best mobile experience:
   - **Android**: Open in Chrome -> Tap `⋮` (Menu) -> **"Add to Home screen"** (runs full screen like a native app).
   - **iOS**: Open in Safari -> Tap Share -> **"Add to Home Screen"**.

---

## 📋 Receipt Format Example

```text
================================
           SODANARAGA           
    Authentic Food & Flavors    
     Phone: +91 98765 43210     
================================
Inv: #1001            Token: #1
Date: 01/11/2026    Time: 09:30 PM
Type: Table 1       Cust: Rajesh
--------------------------------
ITEM           QTY   RATE   TOTAL
--------------------------------
Dum Biryani      2    280    560
Butter Naan      3     60    180
Mango Lassi      2     90    180
--------------------------------
Subtotal:              Rs.920.00
Discount (5%):          -Rs.46.00
CGST (2.5%):            +Rs.21.85
SGST (2.5%):            +Rs.21.85
Round Off:              +Rs.0.30
--------------------------------
GRAND TOTAL:           Rs.918.00
--------------------------------
Payment Mode:    UPI / QR (Paid)
--------------------------------
    Thank you for dining at
          Sodanaraga!
          Visit again.
================================
```
