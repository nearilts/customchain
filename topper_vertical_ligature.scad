// =========================================================================
//   MULTI-NAME TOPPER COMBINED VERSION (Auto-detect Ligatures + Calibrated Spacing)
// =========================================================================
// Jumlah kolom grid
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
base_color_name    = "Peak Green"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
letters_color_name = "White";      // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]

/* [Settings] */
font_name        = "Bagel Fat One"; // font [Bagel Fat One, Chewy, Courgette, Dancing Script, Lemon, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
letter_height    = 12;
letter_thickness = 1.4;
base_height      = 12;
outline_margin   = 4;
hole_orientation = "FRONTBACK"; // ["FRONTBACK", "TOPBOTTOM"]
hole_diameter    = 7.8;
hole_length      = 200;
hole_x           = 21;
hole_y           = 4;
hole_z           = base_height / 2;

// Width scale for individual character layout (used when ligature is detected)
Width_Scale       = 1.0;   // [0.8:0.02:1.5]
// Extra space between characters for ligatures ff / fi / fl
Ligature_Extra    = 1.5;   // [0:0.1:5]

/* [Font Spacing Calibration] */
// Metode perhitungan jarak (0 = Metode Asli, 1 = Metode Rata-rata/Average)
Spacing_Method    = 0; // [0: Asli, 1: Rata-Rata]

// Jenis tabel lebar huruf (0 = Kalibrasi v6 Teroptimasi, 1 = Kustom 0.70)
Table_Type        = 0; // [0: Kalibrasi v6, 1: Kustom 0.70]

/* [Layout Grid] */
// Ukuran bed printer (mm)
bed_x = 235;
bed_y = 235;



// Jarak antar nama (mm)
gap_x = 10;
gap_y = 10;

// Estimasi lebar & tinggi per slot nama (mm)
slot_w = 60;
slot_h = 25;

/* [Direction/Alignment] */
rtl         = false;
text_halign = rtl ? "right" : "left";

/* ===============================
   COLOR MAPPING (NAME → HEX)
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
$fn = 100;

// Alias to match keychain calibration variable names
Font_Size = letter_height;

// ─────────────────────────────────────────────
// LOOKUP TABLE FOR CHARACTER WIDTHS
// ─────────────────────────────────────────────
function char_w_raw(c, type) =
    type == 0 ? (
        // Kalibrasi v6 Teroptimasi (Fiks Pilihan User)
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
        c=="v" ? 0.74 : c=="w" ? 1.34 : c=="x" ? 0.70 :
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

function is_ligature(prev, cur) =
    prev == "f" && (cur == "f" || cur == "i" || cur == "l");

function cx(word, idx) =
    idx == 0 ? 0 :
    cx(word, idx-1)
    + (
        Spacing_Method == 0 ? 
        char_w(word[idx-1]) * Font_Size * Width_Scale : 
        ((char_w(word[idx-1]) + char_w(word[idx])) / 2) * Font_Size * Width_Scale
    )
    + (is_ligature(word[idx-1], word[idx]) ? Ligature_Extra : 0);

function get_word_width(word) =
    len(word) == 0 ? 0 :
    cx(word, len(word)-1) + char_w(word[len(word)-1]) * Font_Size * Width_Scale;

// ─────────────────────────────────────────────
// ALIGNMENT TEXT
// ─────────────────────────────────────────────
function align_offset() =
    text_halign == "left"   ? 0 :
    text_halign == "right"  ? 0 :
    0;

// Merender kata huruf demi huruf dengan baseline vertikal sejajar
module render_chars(word) {
    for (i = [0 : len(word) - 1]) {
        translate([cx(word, i), 0, 0])
            text(word[i], size = Font_Size, font = font_name, valign = "baseline");
    }
}

// Merender baris secara per-karakter agar perhitungan koordinat spasi 100% sinkron
module render_line(word) {
    align_shift = 
        text_halign == "center" ? -get_word_width(word) / 2 :
        text_halign == "right"  ? -get_word_width(word) :
        0;
    translate([align_shift, 0, 0])
        render_chars(word);
}

/* ===============================
   MODULES (TERKALIBRASI SECARA PER-KARAKTER)
   =============================== */
module base_with_tunnel(text_string) {
    difference() {
        linear_extrude(height = base_height)
            offset(delta = outline_margin)
                render_line(text_string);
                
        if (hole_orientation == "FRONTBACK") {
            translate([ 0, hole_y, hole_z ])
                rotate([ 0, 90, 0 ])
                    cylinder(d = hole_diameter, h = hole_length, center = true);
        }
        else if (hole_orientation == "TOPBOTTOM") {
            translate([ hole_x, 0, hole_z ])
                rotate([ 90, 0, 0 ])
                    cylinder(d = hole_diameter, h = hole_length, center = true);
        }
        else {
            echo("Error: hole_orientation must be \"FRONTBACK\" or \"TOPBOTTOM\".");
        }
    }
}

module raised_letters(text_string) {
    translate([ 0, 0, base_height ])
        linear_extrude(height = letter_thickness)
            render_line(text_string);
}

module name_topper(text_string) {
    color(base_color)    base_with_tunnel(text_string);
    color(letters_color) raised_letters(text_string);
}

/* ===============================
   GENERATE — grid layout, center di bed
   =============================== */
nama_all = [nama_1, nama_2, nama_3, nama_4, nama_5,
            nama_6, nama_7, nama_8, nama_9, nama_10];

// filter nama yang tidak kosong
filled = [for (n = nama_all) if (n != "") n];
total  = len(filled);

// hitung jumlah baris
grid_rows = ceil(total / grid_cols);

// total ukuran grid
total_w = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h = grid_rows * slot_h + (grid_rows - 1) * gap_y;

// offset agar center di bed
start_x = (bed_x - total_w) / 2;
start_y = (bed_y - total_h) / 2;

for (idx = [0 : total - 1]) {
    col = idx % grid_cols;
    row = floor(idx / grid_cols);

    x = start_x + col * (slot_w + gap_x);
    y = start_y + (grid_rows - 1 - row) * (slot_h + gap_y); // baris pertama di atas

    translate([ x, y, 0 ])
        name_topper(filled[idx]);
}