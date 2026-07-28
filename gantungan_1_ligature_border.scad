// =========================================================================
//   CUSTOM KEYCHAIN – 1 Baris Ligature + Border Lines
//   (Auto-detect Ligatures ff / fi / fl + Border Line Ring)
// =========================================================================

/* [Nama] */
n1 = "Adi";
n1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n2 = "";
n2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n3 = "";
n3_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n4 = "";
n4_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n5 = "";
n5_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n6 = "";
n6_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

/* [Warna] */
Plate_Color_Name  = "White";    // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Text_Color_Name   = "Sky Blue"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]
Border_Color_Name = "Sky Blue"; // [Yellow, White, Sky Blue, Red, Peak Green, Orange, Grape Purple, Black, Beige, Barbie Pink]

/* [Font Settings] */
Font_Name         = "Bagel Fat One"; // [Lemon, Bagel Fat One, Pixelify Sans:style=Medium, Chewy, Courgette, Dancing Script, Lobster, Pacifico, Playfair, Lily Script One, Sacramento, Bubblegum Sans, DynaPuff, Alkatra, Archivo, Sour Gummy, Shrikhand]
Font_Size         = 15;
Font_Weight_Steps = 0; // [-10:1:20]
Font_Weight       = Font_Weight_Steps / 10;
Letter_Spacing    = 1.00; // [0.8:0.01:2.0]

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

/* [Border Line Settings] */
Border_Line_Width  = 1.2; // [0.5:0.1:3.0] Lebar garis border (mm)
Border_Line_Height = 1.5; // [0.5:0.1:3.0] Tinggi garis (menonjol ke atas, mm)
Border_Smooth      = 4;   // [0:0.5:8] Halus/smooth kontur border (lebih tinggi = lebih oval)

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

Plate_Color  = getColor(Plate_Color_Name);
Text_Color   = getColor(Text_Color_Name);
Border_Color = getColor(Border_Color_Name);
$fn = 64;

slot_h = Font_Size + 2 * Border_Size;

function fixedHoleY() = Font_Size * 0.5 + Hole_Height_Offset;

// -------------------------------------------------
// TABEL LEBAR HURUF
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

function char_advance(str_val, i) =
    i >= len(str_val) ? 0 :
    let(
        curr = str_val[i],
        prev = i > 0 ? str_val[i-1] : "",
        is_lig = i > 0 && is_ligature_pair(prev, curr),
        extra  = is_lig ? Ligature_Extra : 0,
        base_w = Spacing_Method == 1 ?
            (i > 0 ? (char_w(prev) + char_w(curr)) / 2 * Font_Size * Width_Scale : 0) :
            (i > 0 ? char_w(prev) * Font_Size * Width_Scale : 0)
    )
    (base_w + extra) * Letter_Spacing;

function cx(str_val, i) =
    i <= 0 ? 0 :
    cx(str_val, i - 1) + char_advance(str_val, i);

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

function get_raw_word_width(word) =
    let(cleaned = clean_text(word))
    len(cleaned) == 0 ? 0 :
    cx(cleaned, len(cleaned)-1) + char_w(cleaned[len(cleaned)-1]) * Font_Size * Width_Scale;

module render_chars(word) {
    cleaned = clean_text(word);
    for (i = [0 : len(cleaned) - 1]) {
        translate([cx(cleaned, i), 0, 0])
            offset(delta = Font_Weight)
                text(cleaned[i], size = Font_Size, font = Font_Name);
    }
}

module generateTextShape(l1, icon_name = "None") {
    effective_icon = resolve_icon(l1, icon_name);
    cleaned = clean_text(l1);
    word_w  = get_raw_word_width(l1);

    translate([Offset_L1, 0, 0]) {
        if (cleaned != "") {
            if (has_ligature(cleaned)) {
                render_chars(cleaned);
            } else {
                offset(delta = Font_Weight)
                    text(cleaned, size = Font_Size, font = Font_Name, spacing = Letter_Spacing);
            }
        }
        if (effective_icon != "None") {
            translate([word_w, 0, 0])
                offset(delta = Font_Weight)
                    draw_icon(effective_icon, size = Font_Size * 0.9);
        }
    }
}

// -------------------------------------------------
// BACKPLATE 2D SHAPE - menggabungkan teks offset & ring gantungan
// -------------------------------------------------
module backPlate2D(l1, icon_name = "None") {
    union() {
        offset(r = -Border_Smooth)
            offset(r = Border_Size + Border_Smooth)
                generateTextShape(l1, icon_name);
        hull() {
            translate([(-3 + Ring_Offset), fixedHoleY()])
                circle(r = Hole_Radius + 2);
            translate([2, fixedHoleY()])
                circle(r = Hole_Radius + 2);
        }
    }
}

// -------------------------------------------------
// BORDER LINE - garis menonjol di seluruh pinggir luar plat
// -------------------------------------------------
module generateBorderLine(l1, icon_name = "None") {
    color(Border_Color)
    translate([0, 0, Plate_Height])
    linear_extrude(Border_Line_Height)
        difference() {
            backPlate2D(l1, icon_name);
            offset(r = -Border_Line_Width)
                backPlate2D(l1, icon_name);
            translate([(-3 + Ring_Offset), fixedHoleY()])
                circle(r = Hole_Radius);
        }
}

module generateBackPlateWithHole(l1, icon_name = "None") {
    color(Plate_Color)
    linear_extrude(Plate_Height)
        difference() {
            backPlate2D(l1, icon_name);
            translate([(-3 + Ring_Offset), fixedHoleY()])
                circle(r = Hole_Radius);
        }
}

module generateKeychainText(l1, icon_name = "None") {
    color(Text_Color)
    translate([0, 0, Plate_Height])
    linear_extrude(Text_Height)
        generateTextShape(l1, icon_name);
}

module keychain(l1, icon_name = "None") {
    generateBackPlateWithHole(l1, icon_name);
    generateKeychainText(l1, icon_name);
    generateBorderLine(l1, icon_name);
}

all_names = [n1, n2, n3, n4, n5, n6];
all_icons = [n1_icon, n2_icon, n3_icon, n4_icon, n5_icon, n6_icon];

active_indices = [for (i = [0:5]) if (all_names[i] != "") i];
total  = len(active_indices);

grid_rows = ceil(total / grid_cols);
total_w   = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h   = grid_rows * slot_h + (grid_rows - 1) * gap_y;
start_x   = (bed_x - total_w) / 2 + slot_w / 2;
start_y   = (bed_y - total_h) / 2 + slot_h / 2;

if (total > 0) {
    for (idx = [0 : total - 1]) {
        i   = active_indices[idx];
        col = idx % grid_cols;
        row = floor(idx / grid_cols);
        x   = start_x + col * (slot_w + gap_x);
        y   = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);
        translate([x, y, 0]) keychain(all_names[i], all_icons[i]);
    }
}