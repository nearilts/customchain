/* =====================================================
   Multi-Name Topper (FIX PERFECT CENTER)
   ===================================================== */

grid_cols = 2;
/* [Nama] */
nama_1  = "Adi";
nama_2  = "";
nama_3  = "";
nama_4  = "";
nama_5  = "";
nama_6  = "";
nama_7  = "";
nama_8  = "";
nama_9  = "";
nama_10 = "";

/* [Warna] */ 
base_color_name = "Peak Green"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink] 

letters_color_name = "White"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
/* [Settings] */
font_name        = "Bagel Fat One"; // font [Bagel Fat One, Chewy, Courgette, Dancing Script, Lemon, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
letter_height    = 12;
letter_thickness = 1.4;
base_height      = 12;
outline_margin   = 4;

hole_orientation = "TOPBOTTOM";
hole_diameter    = 7.8;
hole_length      = 200;

hole_y = 4;
hole_z = base_height / 2;

/* [Layout Grid] */
bed_x = 235;
bed_y = 235;


gap_x = 10;
gap_y = 10;

slot_w = 70;
slot_h = 25;

/* ===============================
   COLOR
   =============================== */
function getColor(name) =
    name == "Yellow"       ? "#FFD700" :
    name == "White"        ? "#FFFFFF" :
    name == "Sky Blue"     ? "#87CEEB" :
    name == "Red"          ? "#FF0000" :
    name == "Peak Green"   ? "#00C853" :
    name == "Orange"       ? "#FF6A00" :
    name == "Grape Purple" ? "#6A0DAD" :
    name == "Black"        ? "#000000" :
    name == "Beige"        ? "#F5F5DC" :
    name == "Barbie Pink"  ? "#FF69B4" :
    "#FFFFFF";

base_color    = getColor(base_color_name);
letters_color = getColor(letters_color_name);

/* ===============================
   MODULES (CENTER FIX)
   =============================== */
module base_with_tunnel(text_string) {

    difference() {
        linear_extrude(height = base_height)
            offset(delta = outline_margin)
                text(
                    text_string,
                    size   = letter_height,
                    font   = font_name,
                    halign = "center",   // 🔥 FIX
                    valign = "baseline"
                );

        // 🔥 HOLE SELALU DI TENGAH REAL
        if (hole_orientation == "TOPBOTTOM") {
            translate([ 0, 0, hole_z ])
                rotate([ 90, 0, 0 ])
                    cylinder(d = hole_diameter, h = hole_length, center = true, $fn = 100);
        }
        else if (hole_orientation == "FRONTBACK") {
            translate([ 0, hole_y, hole_z ])
                rotate([ 0, 90, 0 ])
                    cylinder(d = hole_diameter, h = hole_length, center = true, $fn = 100);
        }
    }
}

module raised_letters(text_string) {
    translate([ 0, 0, base_height ])
        linear_extrude(height = letter_thickness)
            text(
                text_string,
                size   = letter_height,
                font   = font_name,
                halign = "center",   // 🔥 FIX
                valign = "baseline"
            );
}

module name_topper(text_string) {
    color(base_color)    base_with_tunnel(text_string);
    color(letters_color) raised_letters(text_string);
}

/* ===============================
   GENERATE GRID
   =============================== */
nama_all = [
    nama_1, nama_2, nama_3, nama_4, nama_5,
    nama_6, nama_7, nama_8, nama_9, nama_10
];

filled = [for (n = nama_all) if (n != "") n];
total  = len(filled);

grid_rows = ceil(total / grid_cols);

total_w = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h = grid_rows * slot_h + (grid_rows - 1) * gap_y;

start_x = (bed_x - total_w) / 2;
start_y = (bed_y - total_h) / 2;

/* ===============================
   LOOP RENDER
   =============================== */
for (idx = [0 : total - 1]) {

    col = idx % grid_cols;
    row = floor(idx / grid_cols);

    // 🔥 karena text sudah center di (0,0)
    x = start_x + col * (slot_w + gap_x) + slot_w / 2;
    y = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);

    translate([ x, y, 0 ])
        name_topper(filled[idx]);
}