// ===============================
//   CUSTOM KEYCHAIN – 3 Baris (max 3 nama)
// ===============================

/* [Text Alignment] */
Text_Align = "left"; // ["left","center","right"]

/* [Nama 1] */
n1_line1 = "Adi";
n1_line2 = "";
n1_line3 = "";

/* [Nama 2] */
n2_line1 = "";
n2_line2 = "";
n2_line3 = "";

/* [Nama 3] */
n3_line1 = "";
n3_line2 = "";
n3_line3 = "";

/* [Warna] */
Plate_Color_Name = "White";    // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Text_Color_Name  = "Sky Blue"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]

/* [Font Settings] */
Font_Name         = "Bagel Fat One"; // font [Bagel Fat One, Chewy, Courgette, Dancing Script, Lemon, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
Font_Size         = 13;
Font_Weight_Steps = 0; // [-10:1:20]
Font_Weight       = Font_Weight_Steps / 10;

// Faktor estimasi lebar rata-rata per karakter (tanpa tabel kalibrasi)
// Sesuaikan nilai ini jika posisi lubang kurang pas untuk font tertentu
Width_Factor      = 0.76; // [0.5:0.01:1.2]

/* [Model Settings] */
Text_Height        = 2;
Plate_Height       = 3;
Border_Size        = 5;
Hole_Radius        = 3;
Hole_position      = 0; // [0:0.5:5] Mengatur seberapa masuk lubang ke dalam huruf pertama
Hole_Height_Offset = 0;
Line2_Spacing      = 1.35; // [0.5:0.1:2]
Line3_Spacing      = 1.35; // [0.5:0.1:2]
Offset_L1          = 0;   // [-40:1:40]
Offset_L2          = 0;   // [-40:1:40]
Offset_L3          = 0;   // [-40:1:40]

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
    name == "Beige"        ? "#D9B99b" :
    name == "Barbie Pink"  ? "#FF69B4" :
    "#FFFFFF";

Plate_Color = getColor(Plate_Color_Name);
Text_Color  = getColor(Text_Color_Name);
$fn = 64;

slot_h = Font_Size * (1 + Line2_Spacing + Line3_Spacing) + 2 * Border_Size;

// ─────────────────────────────────────────────
// ESTIMASI LEBAR KATA (tanpa tabel kalibrasi font)
// ─────────────────────────────────────────────
function get_word_width(word) = len(word) * Font_Size * Width_Factor;

// ─────────────────────────────────────────────
// ALIGNMENT TEXT & DYNAMIC HOLE LOGIC
// (Struktur identik dengan gantungan_2_3__ligature.scad)
// ─────────────────────────────────────────────
function align_offset() =
    Text_Align == "left"   ? -slot_w/2 + Border_Size :
    Text_Align == "right"  ?  slot_w/2 - Border_Size :
    0;

function get_line_left(word, offset_val) =
    Text_Align == "left"   ? align_offset() + offset_val :
    Text_Align == "center" ? align_offset() + offset_val - get_word_width(word) / 2 :
    Text_Align == "right"  ? align_offset() + offset_val - get_word_width(word) :
    align_offset() + offset_val;

// Lobang selalu diposisikan relatif terhadap batas kiri Baris 1 (l1) agar tidak melayang
function fixedHoleX(l1) = get_line_left(l1, Offset_L1) - Hole_Radius + Hole_position;
function fixedHoleY() = Font_Size * 0.5 + Hole_Height_Offset;

// Merender baris teks dengan alignment manual (bukan halign bawaan OpenSCAD)
// agar posisi teks & lubang selalu sinkron
module render_line(word) {
    align_shift = 
        Text_Align == "center" ? -get_word_width(word) / 2 :
        Text_Align == "right"  ? -get_word_width(word) :
        0;
    translate([align_shift, 0, 0])
        offset(delta = Font_Weight)
            text(word, size = Font_Size, font = Font_Name);
}

// ─────────────────────────────────────────────
// GEOMETRY GENERATION
// ─────────────────────────────────────────────
module generateTextShape(l1, l2, l3) {
    union() {
        base_x = align_offset();

        translate([base_x + Offset_L1, 0, 0])
            render_line(l1);

        if (l2 != "")
            translate([base_x + Offset_L2, -Font_Size * Line2_Spacing, 0])
                render_line(l2);

        if (l3 != "")
            translate([base_x + Offset_L3, -Font_Size * (Line2_Spacing + Line3_Spacing), 0])
                render_line(l3);
    }
}

module generateBackPlate(l1, l2, l3) {
    union() {
        // plate dari text
        linear_extrude(Plate_Height)
            offset(r = Border_Size)
                generateTextShape(l1, l2, l3);

        // ring hole FIX kiri (DYNAMIC)
        hull() {
            translate([fixedHoleX(l1), fixedHoleY(), 0])
                cylinder(h = Plate_Height, r = Hole_Radius + 2);

            translate([fixedHoleX(l1) + 5, fixedHoleY(), 0])
                cylinder(h = Plate_Height, r = Hole_Radius + 2);
        }
    }
}

module generateBackPlateWithHole(l1, l2, l3) {
    color(Plate_Color)
    difference() {
        generateBackPlate(l1, l2, l3);

        translate([fixedHoleX(l1), fixedHoleY(), -1])
            cylinder(h = Plate_Height + 2, r = Hole_Radius);
    }
}

module generateKeychainText(l1, l2, l3) {
    translate([0, 0, Plate_Height])
        color(Text_Color)
            linear_extrude(Text_Height)
                generateTextShape(l1, l2, l3);
}

module keychain(l1, l2, l3) {
    generateBackPlateWithHole(l1, l2, l3);
    generateKeychainText(l1, l2, l3);
}

// ─────────────────────────────────────────────
// DATA FILTER & GRID
// ─────────────────────────────────────────────
all_l1 = [n1_line1, n2_line1, n3_line1];
all_l2 = [n1_line2, n2_line2, n3_line2];
all_l3 = [n1_line3, n2_line3, n3_line3];

filled_l1 = [for (i = [0:2]) if (all_l1[i] != "") all_l1[i]];
filled_l2 = [for (i = [0:2]) if (all_l1[i] != "") all_l2[i]];
filled_l3 = [for (i = [0:2]) if (all_l1[i] != "") all_l3[i]];

total  = len(filled_l1);

grid_rows = ceil(total / grid_cols);
total_w   = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h   = grid_rows * slot_h + (grid_rows - 1) * gap_y;

start_x   = (bed_x - total_w) / 2 + slot_w / 2;
start_y   = (bed_y - total_h) / 2 + slot_h / 2;

// ─────────────────────────────────────────────
// RENDER
// ─────────────────────────────────────────────
for (idx = [0 : total - 1]) {
    col = idx % grid_cols;
    row = floor(idx / grid_cols);
    x   = start_x + col * (slot_w + gap_x);
    y   = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);

    translate([x, y, 0])
        keychain(filled_l1[idx], filled_l2[idx], filled_l3[idx]);
}
