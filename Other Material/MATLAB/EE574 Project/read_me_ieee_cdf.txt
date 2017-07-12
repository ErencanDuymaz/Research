Partial Description of the IEEE Common Data Format for the    
Exchange of Solved Load Flow Data

The complete description can be found in the paper "Common Data
Format for the Exchange of Solved Load Flow Data", Working Group on a
Common Format for the Exchange of Solved Load Flow Data, _IEEE
Transactions on Power Apparatus and Systems_, Vol. PAS-92, No. 6,
November/December 1973, pp. 1916-1925.

The data file has lines of up to 128 characters. The lines are grouped
into sections with section headers. Data items are entered in specific
columns. No blank items are allowed, enter zeros instead. Floating point
items should have explicit decimal point. No implicit decimal points
are used.

Data type codes: A - Alphanumeric (no special characters)
                 I - Integer
                 F - Floating point
                 * - Mandatory item

Title Data
==========

First card in file.

Columns  1- 8   Date, in format DD/MM/YY with leading zeros. If no date
                provided, use 0b/0b/0b where b is blank.

Columns 10-30   Originator's name (A)

Columns 31-36   MVA Base (F*)

Columns 38-41   Year (I)

Column  43      Season (S - Summer, W - Winter)

Column  45-73   Case identification (A)

Bus Data *
==========

Section start card *:
---------------------

Columns  1-16   BUS DATA FOLLOWS (not clear that any more than BUS in
                1-3 is significant) *

Columns  41-46  NNNNN ITEMS

Bus data cards *:
-----------------

Columns  1- 4   Bus number (I) *
Columns  6-17   Name (A) (left justify) *
Columns 19-20   Load flow area number (I) Don't use zero! *
Columns 21-23   Loss zone number (I)
Columns 25-26   Type (I) *
                 0 - Unregulated (load, PQ)
                 1 - Hold MVAR generation within voltage limits, (PQ)
                 2 - Hold voltage within VAR limits (gen, PV)
                 3 - Hold voltage and angle (swing, V-Theta) (must always
                      have one)
Columns 28-32   Final voltage, p.u. (F) *
Columns 34-39   Final angle, degrees (F) *
Columns 41-48   Load MW (F) *
Columns 50-57   Load MVAR (F) *
Columns 60-66   Generation MW (F) *
Columns 68-74   Generation MVAR (F) *
Columns 77-82   Base KV (F)
Columns 85-90   Desired volts (pu) (F) (This is desired remote voltage if
                this bus is controlling another bus.
Columns 91-97   Maximum MVAR or voltage limit (F)
Columns 99-105  Minimum MVAR or voltage limit (F)
Columns 107-114 Shunt conductance G (per unit) (F) *
Columns 115-122 Shunt susceptance B (per unit) (F) *
Columns 124-127 Remote controlled bus number

Section end card:
-----------------

Columns  1- 4   -999

Branch Data *
=============

Section start card *:
---------------------

Columns  1-20   BRANCH DATA FOLLOWS (not clear that any more than BRANCH
                is significant) *

Columns  41-46  NNNNN ITEMS (column not clear, I would not count on this)

Branch data cards *:
--------------------

Columns  1- 4   Tap bus number (I) *
                 For transformers or phase shifters, the side of the model
                 the non-unity tap is on
Columns  6- 9   Z bus number (I) *
                 For transformers and phase shifters, the side of the model
                 the device impedance is on.
Columns 11-12   Load flow area (I)
Columns 13-15   Loss zone (I)
Column  17      Circuit (I) * (Use 1 for single lines)
Column  19      Type (I) *
                 0 - Transmission line
                 1 - Fixed tap
                 2 - Variable tap for voltage control (TCUL, LTC)
                 3 - Variable tap (turns ratio) for MVAR control
                 4 - Variable phase angle for MW control (phase shifter)
Columns 20-29   Branch resistance R, per unit (F) *
Columns 30-40   Branch reactance X, per unit (F) * No zero impedance lines
Columns 41-50   Line charging B, per unit (F) * (total line charging, +B)
Columns 51-55   Line MVA rating No 1 (I) Left justify!
Columns 57-61   Line MVA rating No 2 (I) Left justify!
Columns 63-67   Line MVA rating No 3 (I) Left justify!
Columns 69-72   Control bus number
Column  74      Side (I)
                 0 - Controlled bus is one of the terminals
                 1 - Controlled bus is near the tap side
                 2 - Controlled bus is near the impedance side (Z bus)
Columns 77-82   Transformer final turns ratio (F)
Columns 84-89   Transformer (phase shifter) final angle (F)
Columns 91-97   Minimum tap or phase shift (F)
Columns 98-104  Maximum tap or phase shift (F)
Columns 106-111 Step size (F)
Columns 113-118 Minimum voltage, MVAR or MW limit (F)
Columns 119-121 Maximum voltage, MVAR or MW limit (F)
