// ===============================
//   CUSTOM KEYCHAIN – 1 Baris (max 8 nama)
// ===============================

/* [Nama] */
n1 = "Adi";
n2 = "Fahram";
n3 = "";
n4 = "";
n5 = "";
n6 = "";

/* [Warna] */
Plate_Color_Name = "White";    // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Text_Color_Name  = "Sky Blue"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]

/* [Font Settings] */
Font_Name         = "Bagel Fat One"; // font [Bagel Fat One, Chewy, Courgette, Dancing Script, Lemon, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
Font_Size         = 15;
Font_Weight_Steps = 0; // [-10:1:20]
Font_Weight       = Font_Weight_Steps / 10;

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
    name == "Beige"        ? "#D9B99b" :
    name == "Barbie Pink"  ? "#FF69B4" :
    "#FFFFFF";

Plate_Color = getColor(Plate_Color_Name);
Text_Color  = getColor(Text_Color_Name);
$fn = 64;

slot_h = Font_Size + 2 * Border_Size;

function fixedHoleY() = Font_Size * 0.5 + Hole_Height_Offset;

module generateTextShape(l1) {
    translate([Offset_L1, 0, 0])
        offset(delta = Font_Weight)
            text(l1, size = Font_Size, font = Font_Name);
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

all = [n1, n2, n3, n4, n5, n6];
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
