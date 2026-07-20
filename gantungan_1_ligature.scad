// =========================================================================
//   CUSTOM KEYCHAIN – COMBINED VERSION (Auto-detect Ligatures ff / fi / fl)
// =========================================================================

/* [Nama] */
n1 = "Adi";
n2 = "";
n3 = "";
n4 = "";
n5 = "";
n6 = "";

/* [Warna] */
Plate_Color_Name = "Barbie Pink";    // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Text_Color_Name  = "White"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]

/* [Font Settings] */
Font_Name         = "Bagel Fat One"; // font [Bagel Fat One, Chewy, Courgette, Dancing Script, Lemon, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
Font_Size         = 15;
Font_Weight_Steps = 0; // [-10:1:20]
Font_Weight       = Font_Weight_Steps / 10;

// Width scale for individual character layout (used when ligature is detected)
Width_Scale       = 1.0;   // [0.8:0.02:1.5]
// Extra space between characters for ligatures ff / fi / fl
Ligature_Extra    = 1.5;   // [0:0.1:5]

/* [Font Spacing Calibration] */
// Metode perhitungan jarak (0 = Metode Asli, 1 = Metode Rata-rata/Average)
Spacing_Method    = 0; // [0: Asli, 1: Rata-Rata]

// Jenis tabel lebar huruf (0 = Kalibrasi v6, 1 = Kustom 0.70)
Table_Type        = 0; // [0: Kalibrasi v6, 1: Kustom 0.70]

/* [Model Settings] */
Text_Height        = 2;
Plate_Height       = 3;
Border_Size        = 5;
Hole_Radius        = 3;
Ring_Offset        = 0;
Hole_Height_Offset = 0;
Offset_L1          = 0; // [-40:1:40]

/* [Layout Grid] */
bed_x     = 235;
bed_y     = 235;
grid_cols = 1;
slot_w    = 90;
gap_x     = 15;
gap_y     = 15;

function getColor(name) =
    name == "Yellow"       ? "#FFD700" :
    name == "White"        ? "#FFFFFF" :
    name == "Sky Blue"     ? "#87CEEB" :
    name == "Red"          ? "#FF0000" :
    name == "Peak Green"   ? "#00C853" :
    name == "Orange"       ? "#FF5E00" :
    name == "Grape Purple" ? "#6A0DAD" :
    name == "Black"        ? "#000000" :
    name == "Beige"        ? "#D9B99b" : // Beige dari kodingan 1
    name == "Barbie Pink"  ? "#FF69B4" :
    "#FFFFFF";

Plate_Color = getColor(Plate_Color_Name);
Text_Color  = getColor(Text_Color_Name);
$fn = 64;

slot_h = Font_Size + 2 * Border_Size;

function fixedHoleY() = Font_Size * 0.5 + Hole_Height_Offset;

// ─────────────────────────────────────────────
// LOOKUP TABLE FOR CHARACTER WIDTHS
// ─────────────────────────────────────────────
function char_w_raw(c, type) =
    type == 0 ? (
        // Kalibrasi v6 (Rekomendasi - Dioptimasi presisi agar bebas renggang/ompong & bebas menempel)
        c=="A" ? 0.96 : c=="B" ? 0.80 : c=="C" ? 0.84 :
        c=="D" ? 0.84 : c=="E" ? 0.86 : c=="F" ? 0.76 :
        c=="G" ? 0.86 : c=="H" ? 0.93 : c=="I" ? 0.4  :
        c=="J" ? 0.76 : c=="K" ? 0.92 : c=="L" ? 0.74 :
        c=="M" ? 1.20 : c=="N" ? 0.98 : c=="O" ? 0.90 :
        c=="P" ? 0.88 : c=="Q" ? 0.90 : c=="R" ? 0.92 :
        c=="S" ? 0.90 : c=="T" ? 0.74 : c=="U" ? 0.86 :
        c=="V" ? 0.84 : c=="W" ? 1.14 : c=="X" ? 0.80 :
        c=="Y" ? 0.78 : c=="Z" ? 0.78 :
        c=="a" ? 0.78 : c=="b" ? 0.76 : c=="c" ? 0.74 :
        c=="d" ? 0.84 : c=="e" ? 0.76 : c=="f" ? 0.54 :
        c=="g" ? 0.76 : c=="h" ? 0.78 : c=="i" ? 0.38 : // Dioptimasi agar huruf setelah 'i' tidak menempel
        c=="j" ? 0.44 : c=="k" ? 0.84 : c=="l" ? 0.38 : // Dioptimasi agar huruf setelah 'l' tidak menempel
        c=="m" ? 1.14 : c=="n" ? 0.78 : c=="o" ? 0.78 :
        c=="p" ? 0.76 : c=="q" ? 0.86 : c=="r" ? 0.70 : // Dioptimasi agar 'rn' tidak menempel
        c=="s" ? 0.76 : c=="t" ? 0.70 : c=="u" ? 0.84 : // Dioptimasi agar 'sh' tidak menempel
        c=="v" ? 0.74 : c=="w" ? 1.14 : c=="x" ? 0.70 :
        c=="y" ? 0.74 : c=="z" ? 0.80 : 
        c=="." ? 0.10 :
        c==" " ? 0.50 : 0.76
    ) : (
        // Kustom 0.70
        c=="A" ? 0.96 : c=="B" ? 0.80 : c=="C" ? 0.84 :
        c=="D" ? 0.84 : c=="E" ? 0.76 : c=="F" ? 0.76 :
        c=="G" ? 0.86 : c=="H" ? 0.86 : c=="I" ? 0.4  :
        c=="J" ? 0.56 : c=="K" ? 0.82 : c=="L" ? 0.74 :
        c=="M" ? 1.00 : c=="N" ? 0.98 : c=="O" ? 0.90 :
        c=="P" ? 0.78 : c=="Q" ? 0.90 : c=="R" ? 0.92 :
        c=="S" ? 0.76 : c=="T" ? 0.74 : c=="U" ? 0.86 :
        c=="V" ? 0.84 : c=="W" ? 1.04 : c=="X" ? 0.80 :
        c=="Y" ? 0.78 : c=="Z" ? 0.78 :
        c=="a" ? 0.78 : c=="b" ? 0.70 : c=="c" ? 0.70 :
        c=="d" ? 0.70 : c=="e" ? 0.70 : c=="f" ? 0.54 :
        c=="g" ? 0.70 : c=="h" ? 0.70 : c=="i" ? 0.36 :
        c=="j" ? 0.70 : c=="k" ? 0.70 : c=="l" ? 0.70 :
        c=="m" ? 0.70 : c=="n" ? 0.70 : c=="o" ? 0.70 :
        c=="p" ? 0.70 : c=="q" ? 0.70 : c=="r" ? 0.70 :
        c=="s" ? 0.70 : c=="t" ? 0.70 : c=="u" ? 0.70 :
        c=="v" ? 0.70 : c=="w" ? 0.70 : c=="x" ? 0.70 :
        c=="y" ? 0.70 : c=="z" ? 0.70 :
        c==" " ? 0.50 : 0.76
    );

function char_w(c) = char_w_raw(c, Table_Type);

// ─────────────────────────────────────────────
// DETEKSI & LOGIC LIGATURE
// ─────────────────────────────────────────────

// Fungsi untuk mengecek apakah ada pasangan ligature pada index tertentu
function is_ligature(prev, cur) =
    prev == "f" && (cur == "f" || cur == "i" || cur == "l");

// Fungsi rekursif untuk mengecek apakah kata mengandung ligature ff, fi, atau fl
function has_ligature(word, idx = 0) =
    idx >= len(word) - 1 ? false :
    is_ligature(word[idx], word[idx+1]) ? true :
    has_ligature(word, idx + 1);

// Menghitung koordinat X
function cx(word, idx) =
    idx == 0 ? 0 :
    cx(word, idx-1)
    + (
        Spacing_Method == 0 ? 
        char_w(word[idx-1]) * Font_Size * Width_Scale : 
        ((char_w(word[idx-1]) + char_w(word[idx])) / 2) * Font_Size * Width_Scale
    )
    + (is_ligature(word[idx-1], word[idx]) ? Ligature_Extra : 0);

// Merender kata huruf demi huruf (agar koreksi jarak ligature aktif)
module render_chars(word) {
    for (i = [0 : len(word) - 1]) {
        translate([cx(word, i), 0, 0])
            offset(delta = Font_Weight)
                text(word[i], size = Font_Size, font = Font_Name);
    }
}

// ─────────────────────────────────────────────
// GEOMETRY GENERATION
// ─────────────────────────────────────────────

module generateTextShape(l1) {
    translate([Offset_L1, 0, 0]) {
        if (has_ligature(l1)) {
            // Gunakan render per-karakter jika ada ligature (contoh: "Raffi", "Adifirnan", "Nafisha")
            render_chars(l1);
        } else {
            // Gunakan render bawaan OpenSCAD jika normal (contoh: "Adi", "Fahram")
            offset(delta = Font_Weight)
                text(l1, size = Font_Size, font = Font_Name);
        }
    }
}

module generateBackPlate(l1) {
    linear_extrude(Plate_Height)
        offset(r = Border_Size)
            generateTextShape(l1);
    hull() {
        translate([(-3 + Ring_Offset), fixedHoleY(), 0])
            cylinder(h = Plate_Height, r = Hole_Radius + 2);
        translate([2, fixedHoleY(), 0])
            cylinder(h = Plate_Height, r = Hole_Radius + 2);
    }
}

module generateBackPlateWithHole(l1) {
    color(Plate_Color)
    difference() {
        generateBackPlate(l1);
        translate([(-3 + Ring_Offset), fixedHoleY(), 0])
            cylinder(h = Plate_Height, r = Hole_Radius);
    }
}

module generateKeychainText(l1) {
    color(Text_Color)
    translate([0, 0, Plate_Height])
    linear_extrude(Text_Height)
        generateTextShape(l1);
}

module keychain(l1) {
    generateBackPlateWithHole(l1);
    generateKeychainText(l1);
}

// ─────────────────────────────────────────────
// GRID PLACEMENT
// ─────────────────────────────────────────────

all    = [n1, n2, n3, n4, n5, n6];
filled = [for (n = all) if (n != "") n];
total  = len(filled);

grid_rows = ceil(total / grid_cols);
total_w   = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h   = grid_rows * slot_h + (grid_rows - 1) * gap_y;
start_x   = (bed_x - total_w) / 2 + slot_w / 2;
start_y   = (bed_y - total_h) / 2 + slot_h / 2;

for (idx = [0 : total - 1]) {
    col = idx % grid_cols;
    row = floor(idx / grid_cols);
    x   = start_x + col * (slot_w + gap_x);
    y   = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);
    translate([x, y, 0]) keychain(filled[idx]);
}