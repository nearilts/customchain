// ===============================
//   CUSTOM KEYCHAIN – 3 Baris (max 3 nama)
// ===============================

/* [Text Alignment] */
Text_Align = "left"; // ["left","center","right"]

/* [Nama 1] */
n1_line1 = "Delmora";
n1_line1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n1_line2 = "Avin";
n1_line2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

n1_line3 = "";
n1_line3_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

/* [Nama 2] */
n2_line1 = "";
n2_line1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]
n2_line2 = "";
n2_line2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]
n2_line3 = "";
n2_line3_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

/* [Nama 3] */
n3_line1 = "";
n3_line1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]
n3_line2 = "";
n3_line2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]
n3_line3 = "";
n3_line3_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

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
Line2_Spacing      = 1.38; // [1.0:0.05:2.5]
Line3_Spacing      = 1.25; // [1.0:0.05:2.5]
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
// ─────────────────────────────────────────────
// ─────────────────────────────────────────────
// VECTOR 2D ICONS (100% CGAL Safe untuk MakerWorld)
// ─────────────────────────────────────────────
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
        translate([size * 0.50, 0, 0]) icon_anchor(size);
    } else if (name == "Heart") {
        translate([size * 0.50, 0, 0]) icon_heart(size);
    } else if (name == "Star") {
        translate([size * 0.50, 0, 0]) icon_star(size);
    } else if (name == "Crown") {
        translate([size * 0.50, 0, 0]) icon_crown(size);
    } else if (name == "Paw") {
        translate([size * 0.50, 0, 0]) icon_paw(size);
    } else if (name == "Music") {
        translate([size * 0.50, 0, 0]) icon_music(size);
    } else if (name == "Cat") {
        translate([size * 0.50, 0, 0]) icon_cat(size);
    } else if (name == "Moon") {
        translate([size * 0.50, 0, 0]) icon_moon(size);
    } else if (name == "Sun") {
        translate([size * 0.50, 0, 0]) icon_sun(size);
    } else if (name == "Flower") {
        translate([size * 0.50, 0, 0]) icon_flower(size);
    } else if (name == "Diamond") {
        translate([size * 0.50, 0, 0]) icon_diamond(size);
    } else if (name == "Butterfly") {
        translate([size * 0.50, 0, 0]) icon_butterfly(size);
    } else if (name == "Ribbon") {
        translate([size * 0.50, 0, 0]) icon_ribbon(size);
    } else if (name == "Smile") {
        translate([size * 0.50, 0, 0]) icon_smile(size);
    }
}

// ─────────────────────────────────────────────
// EMOJI / NON-ASCII STRING CLEANER
// (Mencegah error "NO GLYPH" di MakerWorld)
// ─────────────────────────────────────────────
function is_printable_ascii(c) = ord(c) >= 32 && ord(c) <= 126;

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

// ─────────────────────────────────────────────
function char_w_val(c) =
    c=="A" ? 0.96 : c=="B" ? 0.80 : c=="C" ? 0.84 :
    c=="D" ? 0.84 : c=="E" ? 0.86 : c=="F" ? 0.76 :
    c=="G" ? 0.96 : c=="H" ? 0.93 : c=="I" ? 0.4  :
    c=="J" ? 0.76 : c=="K" ? 0.92 : c=="L" ? 0.74 :
    c=="M" ? 1.20 : c=="N" ? 0.98 : c=="O" ? 0.90 :
    c=="P" ? 0.88 : c=="Q" ? 0.90 : c=="R" ? 0.92 :
    c=="S" ? 0.90 : c=="T" ? 0.74 : c=="U" ? 0.86 :
    c=="V" ? 0.84 : c=="W" ? 1.14 : c=="X" ? 0.80 :
    c=="Y" ? 0.78 : c=="Z" ? 0.78 :
    c=="a" ? 0.85 : c=="b" ? 0.79 : c=="c" ? 0.74 :
    c=="d" ? 0.84 : c=="e" ? 0.76 : c=="f" ? 0.54 :
    c=="g" ? 0.76 : c=="h" ? 0.78 : c=="i" ? 0.38 :
    c=="j" ? 0.44 : c=="k" ? 0.84 : c=="l" ? 0.38 :
    c=="m" ? 1.08 : c=="n" ? 0.78 : c=="o" ? 0.78 :
    c=="p" ? 0.76 : c=="q" ? 0.86 : c=="r" ? 0.70 :
    c=="s" ? 0.76 : c=="t" ? 0.70 : c=="u" ? 0.84 :
    c=="v" ? 0.74 : c=="w" ? 1.14 : c=="x" ? 0.70 :
    c=="y" ? 0.74 : c=="z" ? 0.80 :
    c=="." ? 0.10 :
    c==" " ? 0.50 : 0.76;

function sum_char_w(str_val, idx=0) =
    idx >= len(str_val) ? 0 :
    char_w_val(str_val[idx]) + sum_char_w(str_val, idx+1);

function get_raw_word_width(word) =
    let(cleaned = clean_text(word))
    sum_char_w(cleaned) * Font_Size;

function get_word_width(word, icon_name = "None") = 
    let(effective_icon = resolve_icon(word, icon_name))
    get_raw_word_width(word) + (effective_icon != "None" ? Font_Size * 0.9 : 0);

// ─────────────────────────────────────────────
// ALIGNMENT TEXT & DYNAMIC HOLE LOGIC
// ─────────────────────────────────────────────
function align_offset() =
    Text_Align == "left"   ? -slot_w/2 + Border_Size :
    Text_Align == "right"  ?  slot_w/2 - Border_Size :
    0;

function get_line_left(word, offset_val, icon_name = "None") =
    Text_Align == "left"   ? align_offset() + offset_val :
    Text_Align == "center" ? align_offset() + offset_val - get_word_width(word, icon_name) / 2 :
    Text_Align == "right"  ? align_offset() + offset_val - get_word_width(word, icon_name) :
    align_offset() + offset_val;

// Lobang selalu diposisikan relatif terhadap batas kiri Baris 1 (l1) agar tidak melayang
function fixedHoleX(l1, icon_name = "None") = get_line_left(l1, Offset_L1, icon_name) - Hole_Radius + Hole_position;
function fixedHoleY() = Font_Size * 0.5 + Hole_Height_Offset;

// Merender baris teks dengan alignment manual + auto vector icon
module render_line(word, icon_name = "None") {
    effective_icon = resolve_icon(word, icon_name);
    cleaned = clean_text(word);
    word_w  = get_raw_word_width(word);
    total_w = get_word_width(word, icon_name);

    align_shift = 
        Text_Align == "center" ? -total_w / 2 :
        Text_Align == "right"  ? -total_w :
        0;
    
    translate([align_shift, 0, 0]) {
        if (cleaned != "") {
            offset(delta = Font_Weight)
                text(cleaned, size = Font_Size, font = Font_Name);
        }
        
        if (effective_icon != "None") {
            translate([word_w, 0, 0])
                offset(delta = Font_Weight)
                    draw_icon(effective_icon, size = Font_Size * 0.9);
        }
    }
}

// ─────────────────────────────────────────────
// ─────────────────────────────────────────────
// GEOMETRY GENERATION
// ─────────────────────────────────────────────
module generateTextShape(l1, l2, l3, ic1 = "None", ic2 = "None", ic3 = "None") {
    union() {
        base_x = align_offset();

        translate([base_x + Offset_L1, 0, 0])
            render_line(l1, ic1);

        if (l2 != "")
            translate([base_x + Offset_L2, -Font_Size * Line2_Spacing, 0])
                render_line(l2, ic2);

        if (l3 != "")
            translate([base_x + Offset_L3, -Font_Size * (Line2_Spacing + Line3_Spacing), 0])
                render_line(l3, ic3);
    }
}

module generateBackPlate(l1, l2, l3, ic1 = "None", ic2 = "None", ic3 = "None") {
    union() {
        // plate dari text
        linear_extrude(Plate_Height)
            offset(r = Border_Size)
                generateTextShape(l1, l2, l3, ic1, ic2, ic3);

        // ring hole FIX kiri (DYNAMIC)
        hull() {
            translate([fixedHoleX(l1, ic1), fixedHoleY(), 0])
                cylinder(h = Plate_Height, r = Hole_Radius + 2);

            translate([fixedHoleX(l1, ic1) + 5, fixedHoleY(), 0])
                cylinder(h = Plate_Height, r = Hole_Radius + 2);
        }
    }
}

module generateBackPlateWithHole(l1, l2, l3, ic1 = "None", ic2 = "None", ic3 = "None") {
    color(Plate_Color)
    difference() {
        generateBackPlate(l1, l2, l3, ic1, ic2, ic3);

        translate([fixedHoleX(l1, ic1), fixedHoleY(), -1])
            cylinder(h = Plate_Height + 2, r = Hole_Radius);
    }
}

module generateKeychainText(l1, l2, l3, ic1 = "None", ic2 = "None", ic3 = "None") {
    translate([0, 0, Plate_Height])
        color(Text_Color)
            linear_extrude(Text_Height)
                generateTextShape(l1, l2, l3, ic1, ic2, ic3);
}

module keychain(l1, l2, l3, ic1 = "None", ic2 = "None", ic3 = "None") {
    generateBackPlateWithHole(l1, l2, l3, ic1, ic2, ic3);
    generateKeychainText(l1, l2, l3, ic1, ic2, ic3);
}

// ─────────────────────────────────────────────
// DATA FILTER & GRID
// ─────────────────────────────────────────────
all_l1  = [n1_line1, n2_line1, n3_line1];
all_ic1 = [n1_line1_icon, n2_line1_icon, n3_line1_icon];

all_l2  = [n1_line2, n2_line2, n3_line2];
all_ic2 = [n1_line2_icon, n2_line2_icon, n3_line2_icon];

all_l3  = [n1_line3, n2_line3, n3_line3];
all_ic3 = [n1_line3_icon, n2_line3_icon, n3_line3_icon];

// Filter indeks nama yang terisi
active_indices = [for (i = [0:2]) if (all_l1[i] != "") i];
total          = len(active_indices);

grid_rows = ceil(total / grid_cols);
total_w   = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h   = grid_rows * slot_h + (grid_rows - 1) * gap_y;

start_x   = (bed_x - total_w) / 2 + slot_w / 2;
start_y   = (bed_y - total_h) / 2 + slot_h / 2;

// ─────────────────────────────────────────────
// RENDER
// ─────────────────────────────────────────────
if (total > 0) {
    for (idx = [0 : total - 1]) {
        i   = active_indices[idx];
        col = idx % grid_cols;
        row = floor(idx / grid_cols);
        x   = start_x + col * (slot_w + gap_x);
        y   = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);

        translate([x, y, 0])
            keychain(
                all_l1[i],  all_l2[i],  all_l3[i],
                all_ic1[i], all_ic2[i], all_ic3[i]
            );
    }
}
