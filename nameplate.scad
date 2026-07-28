// =========================================================================
//   CUSTOM NAMEPLATE GENERATOR (Name Tag Custom 2 Baris - 150x50x5.5mm)
// =========================================================================

/* [Mode Ukuran Plat] */
Plate_Mode         = "Fixed"; // ["Fixed", "Auto"] Fixed = Ukuran 150x50mm, Auto = Menyesuaikan teks
Plate_Width        = 150;     // [50:1:300] Lebar plat jika Mode Fixed (mm)
Plate_Height_Y     = 50;      // [20:1:150] Tinggi plat jika Mode Fixed (mm)
Corner_Radius      = 5;       // [0:1:20] Kebulatan sudut kotak (mm)

/* [Nama 1] */
n1_line1 = "YOUR NAME";
n1_line1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n1_line2 = "JOB POSITION";
n1_line2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

/* [Nama 2] */
n2_line1 = "";
n2_line1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]
n2_line2 = "";
n2_line2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

/* [Nama 3] */
n3_line1 = "";
n3_line1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]
n3_line2 = "";
n3_line2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

/* [Warna] */
Plate_Color_Name  = "Black";    // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Text_Color_Name   = "White";    // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Border_Color_Name = "Yellow";   // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]

/* [Font Baris 1] */
Font_Name_Line1   = "Arial";   // [Arial, Times New Roman, Courier New, Verdana, Georgia, Bagel Fat One, Lemon, Pixelify Sans:style=Medium, Chewy, Courgette, Dancing Script, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
Font_Style_Line1  = "Bold";    // ["Bold", "Regular", "Italic", "Bold Italic"]
Font_Size_Line1   = 12;        // [6:1:35]

/* [Font Baris 2] */
Font_Name_Line2   = "Arial";   // [Arial, Times New Roman, Courier New, Verdana, Georgia, Bagel Fat One, Lemon, Pixelify Sans:style=Medium, Chewy, Courgette, Dancing Script, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
Font_Style_Line2  = "Bold"; // ["Regular", "Bold", "Italic", "Bold Italic"]
Font_Size_Line2   = 8;        // [6:1:30]

/* [Global Font Settings] */
Font_Weight_Steps = 3; // [-10:1:20] Ketebalan ekstra jika mode Bold aktif
Font_Weight       = Font_Weight_Steps / 10;
Letter_Spacing    = 1.00; // [0.8:0.01:2.0]

Width_Scale       = 1.0;   // [0.8:0.02:1.5]
Ligature_Extra    = 1.5;   // [0:0.1:5]
Spacing_Method    = 0; // [0: Asli, 1: Rata-Rata]
Table_Type        = 0; // [0: Kalibrasi v6, 1: Kustom 0.70]

/* [Ketebalan Model (Total Z = 5.5mm)] */
Plate_Height       = 3.5; // [1.0:0.5:10.0] Ketebalan alas plat (mm)
Text_Height        = 2.0; // [0.5:0.5:5.0] Tinggi penonjol teks (Total Z = 3.5 + 2.0 = 5.5mm)
Margin_X           = 10;  // [2:1:30] Margin kiri/kanan teks jika Mode Auto
Margin_Y           = 8;   // [2:1:30] Margin atas/bawah teks jika Mode Auto
Line2_Spacing      = 1.30; // [1.0:0.05:2.5] Spacing antar baris 1 & 2
Offset_L1          = 0;   // [-40:1:40]
Offset_L2          = 0;   // [-40:1:40]

/* [Border Line Settings] */
Show_Border        = 1;   // [1: Ya, 0: Tidak] Tampilkan garis di pinggir plat
Border_Line_Width  = 2.0; // [0.5:0.1:6.0] Lebar garis border (mm)
Border_Line_Height = 2.0; // [0.5:0.1:5.0] Tinggi garis border (menonjol ke atas, mm)
Border_Line_Offset = 2.0; // [0.0:0.5:10.0] Jarak garis dari tepi luar plat (mm)

/* [Layout Grid] */
bed_x     = 235;
bed_y     = 235;
grid_cols = 1;
slot_w    = 160;
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

Plate_Color  = getColor(Plate_Color_Name);
Text_Color   = getColor(Text_Color_Name);
Border_Color = getColor(Border_Color_Name);
$fn = 64;

// -------------------------------------------------
// TABEL LEBAR HURUF & LIGATURE
// -------------------------------------------------
function char_w_raw(c, type) =
    type == 0 ? (
        c=="A" ? 0.96 : c=="B" ? 0.80 : c=="C" ? 0.84 :
        c=="D" ? 0.84 : c=="E" ? 0.76 : c=="F" ? 0.76 :
        c=="G" ? 0.86 : c=="H" ? 0.86 : c=="I" ? 0.4  :
        c=="J" ? 0.76 : c=="K" ? 0.82 : c=="L" ? 0.74 :
        c=="M" ? 1.00 : c=="N" ? 0.98 : c=="O" ? 0.90 :
        c=="P" ? 0.78 : c=="Q" ? 0.90 : c=="R" ? 0.92 :
        c=="S" ? 0.76 : c=="T" ? 0.74 : c=="U" ? 0.86 :
        c=="V" ? 0.84 : c=="W" ? 1.04 : c=="X" ? 0.80 :
        c=="Y" ? 0.78 : c=="Z" ? 0.78 :
        c=="a" ? 0.78 : c=="b" ? 0.76 : c=="c" ? 0.74 :
        c=="d" ? 0.84 : c=="e" ? 0.76 : c=="f" ? 0.54 :
        c=="g" ? 0.76 : c=="h" ? 0.78 : c=="i" ? 0.38 :
        c=="j" ? 0.44 : c=="k" ? 0.74 : c=="l" ? 0.52 :
        c=="m" ? 1.14 : c=="n" ? 0.78 : c=="o" ? 0.78 :
        c=="p" ? 0.76 : c=="q" ? 0.76 : c=="r" ? 0.70 :
        c=="s" ? 0.76 : c=="t" ? 0.60 : c=="u" ? 0.78 :
        c=="v" ? 0.74 : c=="w" ? 0.94 : c=="x" ? 0.70 :
        c=="y" ? 0.74 : c=="z" ? 0.70 :
        c==" " ? 0.50 : 0.76
    ) : (
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

function is_ligature_pair(c1, c2) =
    (c1 == "f" && c2 == "f") ||
    (c1 == "f" && c2 == "i") ||
    (c1 == "f" && c2 == "l");

function has_ligature(str_val) =
    len(str_val) < 2 ? false :
    len([for (i = [0:len(str_val)-2]) if (is_ligature_pair(str_val[i], str_val[i+1])) 1]) > 0;

function char_advance(str_val, i, font_sz) =
    i >= len(str_val) ? 0 :
    let(
        curr = str_val[i],
        prev = i > 0 ? str_val[i-1] : "",
        is_lig = i > 0 && is_ligature_pair(prev, curr),
        extra  = is_lig ? Ligature_Extra : 0,
        base_w = Spacing_Method == 1 ?
            (i > 0 ? (char_w(prev) + char_w(curr)) / 2 * font_sz * Width_Scale : 0) :
            (i > 0 ? char_w(prev) * font_sz * Width_Scale : 0)
    )
    (base_w + extra) * Letter_Spacing;

function cx(str_val, i, font_sz) =
    i <= 0 ? 0 :
    cx(str_val, i - 1, font_sz) + char_advance(str_val, i, font_sz);

// -------------------------------------------------
// VECTOR 2D ICONS
// -------------------------------------------------
module icon_anchor(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            difference() {
                translate([0, 9.5]) circle(r = 2.2, $fn=24);
                translate([0, 9.5]) circle(r = 1.0, $fn=24);
            }
            translate([-0.8, 1]) square([1.6, 7.5]);
            translate([-3, 6]) square([6, 1.3]);
            difference() {
                translate([0, 3.5]) circle(r = 4.5, $fn=24);
                translate([0, 3.5]) circle(r = 2.9, $fn=24);
                translate([-6, 3.5]) square([12, 6]);
            }
            hull() {
                translate([-4.5, 3.5]) circle(r = 0.8, $fn=16);
                translate([-5.5, 5.2]) circle(r = 0.3, $fn=16);
                translate([-3.2, 3.5]) circle(r = 0.8, $fn=16);
            }
            hull() {
                translate([4.5, 3.5]) circle(r = 0.8, $fn=16);
                translate([5.5, 5.2]) circle(r = 0.3, $fn=16);
                translate([3.2, 3.5]) circle(r = 0.8, $fn=16);
            }
        }
    }
}

module icon_heart(h = 10) {
    s = h / 9.5;
    scale([s, s]) {
        translate([0, 0.5]) {
            hull() {
                translate([-2.5, 6.5]) circle(r = 2.5, $fn=24);
                translate([0, 1.2]) circle(r = 0.6, $fn=16);
            }
            hull() {
                translate([2.5, 6.5]) circle(r = 2.5, $fn=24);
                translate([0, 1.2]) circle(r = 0.6, $fn=16);
            }
        }
    }
}

module icon_star(h = 10) {
    r_out = h / 2;
    r_in  = r_out * 0.42;
    translate([0, r_out]) {
        for (i = [0:4]) {
            hull() {
                circle(r = r_in, $fn=16);
                rotate([0, 0, i * 72 + 90]) translate([r_out, 0]) circle(r = 0.5, $fn=12);
            }
        }
    }
}

module icon_crown(h = 10) {
    s = h / 10;
    scale([s, s]) {
        translate([0, 0.5]) {
            hull() {
                translate([-4.5, 0]) square([9, 1.5]);
                translate([0, 7.5]) circle(r = 0.8, $fn=16);
            }
            hull() {
                translate([-4.5, 0]) square([9, 1.5]);
                translate([-4.2, 6.5]) circle(r = 0.8, $fn=16);
            }
            hull() {
                translate([-4.5, 0]) square([9, 1.5]);
                translate([4.2, 6.5]) circle(r = 0.8, $fn=16);
            }
        }
    }
}

module icon_paw(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            hull() {
                translate([0, 3.5]) circle(r = 2.8, $fn=24);
                translate([-2, 2]) circle(r = 1.6, $fn=20);
                translate([2, 2]) circle(r = 1.6, $fn=20);
            }
            translate([-3.3, 7.5]) circle(r = 1.0, $fn=16);
            translate([-1.3, 9.2]) circle(r = 1.1, $fn=16);
            translate([1.3, 9.2]) circle(r = 1.1, $fn=16);
            translate([3.3, 7.5]) circle(r = 1.0, $fn=16);
        }
    }
}

module icon_music(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            rotate([0, 0, -20]) translate([-2.5, 2]) scale([1.3, 0.9]) circle(r = 1.6, $fn=20);
            rotate([0, 0, -20]) translate([1.8, 4]) scale([1.3, 0.9]) circle(r = 1.6, $fn=20);
            translate([-1.5, 2]) square([1.0, 7.5]);
            translate([2.8, 4]) square([1.0, 7.5]);
            hull() {
                translate([-1.5, 8.5]) square([5.3, 1.2]);
                translate([-1.5, 7.5]) square([5.3, 0.5]);
            }
        }
    }
}

module icon_cat(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            translate([0, 4.5]) circle(r = 3.8, $fn=24);
            hull() {
                translate([-3.2, 6]) circle(r = 1.0, $fn=16);
                translate([-3.5, 9.2]) circle(r = 0.3, $fn=12);
                translate([-1.2, 7.2]) circle(r = 0.8, $fn=16);
            }
            hull() {
                translate([3.2, 6]) circle(r = 1.0, $fn=16);
                translate([3.5, 9.2]) circle(r = 0.3, $fn=12);
                translate([1.2, 7.2]) circle(r = 0.8, $fn=16);
            }
        }
    }
}

module icon_moon(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            difference() {
                translate([0, 5]) circle(r = 4.5, $fn=32);
                translate([2.2, 5.5]) circle(r = 4.0, $fn=32);
            }
        }
    }
}

module icon_sun(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 6]) {
            circle(r = 2.5, $fn=24);
            for (a = [0:45:315]) {
                rotate([0, 0, a])
                    hull() {
                        translate([3.2, 0]) circle(r = 0.5, $fn=12);
                        translate([4.6, 0]) circle(r = 0.2, $fn=8);
                    }
            }
        }
    }
}

module icon_flower(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 6]) {
            circle(r = 1.5, $fn=20);
            for (a = [0:72:288]) {
                rotate([0, 0, a])
                    translate([2.5, 0]) circle(r = 1.6, $fn=20);
            }
        }
    }
}

module icon_diamond(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            hull() {
                translate([-4, 6]) square([8, 2]);
                translate([0, 0.5]) circle(r = 0.5, $fn=16);
            }
            hull() {
                translate([-4, 6]) square([8, 2]);
                translate([-2.5, 9.5]) square([5, 0.5]);
            }
        }
    }
}

module icon_butterfly(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            hull() {
                translate([0, 7]) circle(r = 0.8, $fn=16);
                translate([0, 2]) circle(r = 0.5, $fn=16);
            }
            hull() {
                translate([-2.8, 6.8]) circle(r = 2.2, $fn=20);
                translate([0, 5]) circle(r = 0.8, $fn=16);
            }
            hull() {
                translate([2.8, 6.8]) circle(r = 2.2, $fn=20);
                translate([0, 5]) circle(r = 0.8, $fn=16);
            }
            hull() {
                translate([-2.2, 3.2]) circle(r = 1.6, $fn=20);
                translate([0, 4]) circle(r = 0.6, $fn=16);
            }
            hull() {
                translate([2.2, 3.2]) circle(r = 1.6, $fn=20);
                translate([0, 4]) circle(r = 0.6, $fn=16);
            }
        }
    }
}

module icon_ribbon(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            translate([0, 5.5]) circle(r = 1.2, $fn=20);
            hull() {
                translate([0, 5.5]) circle(r = 0.8, $fn=16);
                translate([-3.8, 6.8]) circle(r = 1.8, $fn=20);
                translate([-3.8, 4.2]) circle(r = 1.6, $fn=20);
            }
            hull() {
                translate([0, 5.5]) circle(r = 0.8, $fn=16);
                translate([3.8, 6.8]) circle(r = 1.8, $fn=20);
                translate([3.8, 4.2]) circle(r = 1.6, $fn=20);
            }
            hull() {
                translate([0, 5]) circle(r = 0.6, $fn=12);
                translate([-2.8, 1.2]) circle(r = 0.6, $fn=12);
            }
            hull() {
                translate([0, 5]) circle(r = 0.6, $fn=12);
                translate([2.8, 1.2]) circle(r = 0.6, $fn=12);
            }
        }
    }
}

module icon_smile(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            difference() {
                translate([0, 5]) circle(r = 4.5, $fn=32);
                translate([0, 5]) circle(r = 3.2, $fn=32);
            }
            translate([-1.8, 6.2]) circle(r = 0.7, $fn=16);
            translate([1.8, 6.2]) circle(r = 0.7, $fn=16);
            difference() {
                translate([0, 4.8]) circle(r = 2.2, $fn=24);
                translate([0, 4.8]) circle(r = 1.4, $fn=24);
                translate([-3, 4.8]) square([6, 3]);
            }
        }
    }
}

module draw_icon(name, size = 10) {
    if (name == "Anchor") {
        translate([size * 0.4, 0, 0]) icon_anchor(size);
    } else if (name == "Heart") {
        translate([size * 0.44, 0, 0]) icon_heart(size);
    } else if (name == "Star") {
        translate([size * 0.4, 0, 0]) icon_star(size);
    } else if (name == "Crown") {
        translate([size * 0.4, 0, 0]) icon_crown(size);
    } else if (name == "Paw") {
        translate([size * 0.4, 0, 0]) icon_paw(size);
    } else if (name == "Music") {
        translate([size * 0.4, 0, 0]) icon_music(size);
    } else if (name == "Cat") {
        translate([size * 0.4, 0, 0]) icon_cat(size);
    } else if (name == "Moon") {
        translate([size * 0.4, 0, 0]) icon_moon(size);
    } else if (name == "Sun") {
        translate([size * 0.4, 0, 0]) icon_sun(size);
    } else if (name == "Flower") {
        translate([size * 0.4, 0, 0]) icon_flower(size);
    } else if (name == "Diamond") {
        translate([size * 0.4, 0, 0]) icon_diamond(size);
    } else if (name == "Butterfly") {
        translate([size * 0.4, 0, 0]) icon_butterfly(size);
    } else if (name == "Ribbon") {
        translate([size * 0.4, 0, 0]) icon_ribbon(size);
    } else if (name == "Smile") {
        translate([size * 0.4, 0, 0]) icon_smile(size);
    }
}

// -------------------------------------------------
// EMOJI CLEANER & AUTO DETECT
// -------------------------------------------------
function is_printable_ascii(c) = (ord(c) >= 32 && ord(c) <= 126) || ord(c) == 194 || ord(c) == 176 || ord(c) == 177;

function str_join(arr, idx=0) = 
    idx >= len(arr) ? "" :
    str(arr[idx], str_join(arr, idx+1));

function clean_text(str_val) = 
    len(str_val) == 0 ? "" :
    str_join([for (i = [0:len(str_val)-1]) if (is_printable_ascii(str_val[i])) str_val[i]]);

function has_emoji_or_symbol(str_val) =
    len(str_val) == 0 ? false :
    len([for (i = [0:len(str_val)-1]) if (!is_printable_ascii(str_val[i])) 1]) > 0;

function resolve_icon(word, select_icon) =
    select_icon != "None" ? select_icon :
    has_emoji_or_symbol(word) ? "Anchor" :
    "None";

function get_raw_word_width(word, font_sz) =
    let(cleaned = clean_text(word))
    len(cleaned) == 0 ? 0 :
    cx(cleaned, len(cleaned)-1, font_sz) + char_w(cleaned[len(cleaned)-1]) * font_sz * Width_Scale;

function get_word_width(word, font_sz, icon_name = "None") = 
    let(effective_icon = resolve_icon(word, icon_name))
    get_raw_word_width(word, font_sz) + (effective_icon != "None" ? font_sz * 0.9 : 0);

// -------------------------------------------------
// CALCULATE EXACT BOUNDS & ACCURATE VERTICAL CENTER (2 BARIS)
// -------------------------------------------------
function get_max_width(l1, l2, ic1, ic2) =
    max(
        l1 != "" ? get_word_width(l1, Font_Size_Line1, ic1) : 0,
        l2 != "" ? get_word_width(l2, Font_Size_Line2, ic2) : 0
    );

function y_baseline(line_num) =
    line_num == 1 ? 0 : -Font_Size_Line1 * Line2_Spacing;

function text_top_y(l1, l2) =
    l1 != "" ? Font_Size_Line1 * 0.75 :
    l2 != "" ? y_baseline(2) + Font_Size_Line2 * 0.75 :
    0;

function text_bottom_y(l1, l2) =
    l2 != "" ? y_baseline(2) : 0;

function text_height_total(l1, l2) =
    text_top_y(l1, l2) - text_bottom_y(l1, l2);

function text_midpoint_y(l1, l2) =
    (text_top_y(l1, l2) + text_bottom_y(l1, l2)) / 2;

function get_full_font_name(font_nm, font_st) =
    font_st == "Regular" ? font_nm :
    str(font_nm, ":style=", font_st);

function get_font_weight_delta(font_st) =
    font_st == "Bold" || font_st == "Bold Italic" ? Font_Weight : 0;

// -------------------------------------------------
// RENDER TEXT LINES
// -------------------------------------------------
module render_chars(word, font_nm, font_sz, font_st) {
    cleaned   = clean_text(word);
    full_font = get_full_font_name(font_nm, font_st);
    delta_w   = get_font_weight_delta(font_st);
    for (i = [0 : len(cleaned) - 1]) {
        translate([cx(cleaned, i, font_sz), 0, 0])
            offset(delta = delta_w)
                text(cleaned[i], size = font_sz, font = full_font);
    }
}

module render_line(word, font_nm, font_sz, font_st = "Bold", icon_name = "None") {
    effective_icon = resolve_icon(word, icon_name);
    cleaned   = clean_text(word);
    word_w    = get_raw_word_width(word, font_sz);
    total_w   = get_word_width(word, font_sz, icon_name);
    full_font = get_full_font_name(font_nm, font_st);
    delta_w   = get_font_weight_delta(font_st);

    align_shift = -total_w / 2;
    
    translate([align_shift, 0, 0]) {
        if (cleaned != "") {
            if (has_ligature(cleaned)) {
                render_chars(cleaned, font_nm, font_sz, font_st);
            } else {
                offset(delta = delta_w)
                    text(cleaned, size = font_sz, font = full_font, spacing = Letter_Spacing);
            }
        }
        
        if (effective_icon != "None") {
            translate([word_w, 0, 0])
                offset(delta = delta_w)
                    draw_icon(effective_icon, size = font_sz * 0.9);
        }
    }
}

module generateTextShape(l1, l2, ic1 = "None", ic2 = "None") {
    union() {
        if (l1 != "")
            translate([Offset_L1, y_baseline(1), 0])
                render_line(l1, Font_Name_Line1, Font_Size_Line1, Font_Style_Line1, ic1);

        if (l2 != "")
            translate([Offset_L2, y_baseline(2), 0])
                render_line(l2, Font_Name_Line2, Font_Size_Line2, Font_Style_Line2, ic2);
    }
}

// -------------------------------------------------
// RECTANGULAR BASE BOX (KOTAK NAMEPLATE)
// -------------------------------------------------
module rounded_box_2d(w, h, r) {
    r_eff = min(r, min(w, h) / 2);
    if (r_eff <= 0) {
        square([w, h], center = true);
    } else {
        hull() {
            translate([-w/2 + r_eff, -h/2 + r_eff]) circle(r = r_eff);
            translate([ w/2 - r_eff, -h/2 + r_eff]) circle(r = r_eff);
            translate([-w/2 + r_eff,  h/2 - r_eff]) circle(r = r_eff);
            translate([ w/2 - r_eff,  h/2 - r_eff]) circle(r = r_eff);
        }
    }
}

function get_box_width(l1, l2, ic1, ic2) =
    Plate_Mode == "Fixed" ? Plate_Width :
    (get_max_width(l1, l2, ic1, ic2) + 2 * Margin_X);

function get_box_height(l1, l2) =
    Plate_Mode == "Fixed" ? Plate_Height_Y :
    (text_height_total(l1, l2) + 2 * Margin_Y);

// -------------------------------------------------
// NAMEPLATE BASE PLATE & BORDER FRAME
// -------------------------------------------------
module generateBackPlate(l1, l2, ic1 = "None", ic2 = "None") {
    w = get_box_width(l1, l2, ic1, ic2);
    h = get_box_height(l1, l2);
    
    color(Plate_Color)
    linear_extrude(Plate_Height)
        rounded_box_2d(w, h, Corner_Radius);
}

module generateBorderFrame(l1, l2, ic1 = "None", ic2 = "None") {
    if (Show_Border == 1) {
        w = get_box_width(l1, l2, ic1, ic2);
        h = get_box_height(l1, l2);
        
        color(Border_Color)
        translate([0, 0, Plate_Height])
        linear_extrude(Border_Line_Height)
            difference() {
                rounded_box_2d(w - 2 * Border_Line_Offset, h - 2 * Border_Line_Offset, max(0, Corner_Radius - Border_Line_Offset));
                rounded_box_2d(w - 2 * (Border_Line_Offset + Border_Line_Width), h - 2 * (Border_Line_Offset + Border_Line_Width), max(0, Corner_Radius - Border_Line_Offset - Border_Line_Width));
            }
    }
}

module generateKeychainText(l1, l2, ic1 = "None", ic2 = "None") {
    y_shift = -text_midpoint_y(l1, l2);
    
    translate([0, y_shift, Plate_Height])
        color(Text_Color)
            linear_extrude(Text_Height)
                generateTextShape(l1, l2, ic1, ic2);
}

module nameplate(l1, l2, ic1 = "None", ic2 = "None") {
    generateBackPlate(l1, l2, ic1, ic2);
    generateKeychainText(l1, l2, ic1, ic2);
    generateBorderFrame(l1, l2, ic1, ic2);
}

// -------------------------------------------------
// DATA FILTER & GRID LAYOUT
// -------------------------------------------------
all_l1  = [n1_line1, n2_line1, n3_line1];
all_ic1 = [n1_line1_icon, n2_line1_icon, n3_line1_icon];

all_l2  = [n1_line2, n2_line2, n3_line2];
all_ic2 = [n1_line2_icon, n2_line2_icon, n3_line2_icon];

active_indices = [for (i = [0:2]) if (all_l1[i] != "") i];
total          = len(active_indices);

grid_rows = ceil(total / grid_cols);
total_w   = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h   = grid_rows * 60 + (grid_rows - 1) * gap_y;

start_x   = (bed_x - total_w) / 2 + slot_w / 2;
start_y   = (bed_y - total_h) / 2 + 30;

if (total > 0) {
    for (idx = [0 : total - 1]) {
        i   = active_indices[idx];
        col = idx % grid_cols;
        row = floor(idx / grid_cols);
        x   = start_x + col * (slot_w + gap_x);
        y   = start_y + (grid_rows - 1 - row) * (60 + gap_y);

        translate([x, y, 0])
            nameplate(
                all_l1[i],  all_l2[i],
                all_ic1[i], all_ic2[i]
            );
    }
}