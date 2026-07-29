/* =====================================================
   Disney Pencil Topper - Waltograph Font
   Font: Waltograph42 (fan-made Disney-style font)
   File font HARUS ada di folder yang sama: waltograph42.otf
   Referensi: topper_vertical.scad
   ===================================================== */

// Load Waltograph font dari folder lokal (untuk OpenSCAD lokal)
// Di MakerWorld: font di-bundle bersama file ini
use <waltograph42.otf>

grid_cols = 2;

/* [Nama] */
nama_1  = "Putri";
nama_1_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_2  = "";
nama_2_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_3  = "";
nama_3_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_4  = "";
nama_4_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_5  = "";
nama_5_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_6  = "";
nama_6_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_7  = "";
nama_7_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_8  = "";
nama_8_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_9  = "";
nama_9_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

nama_10 = "";
nama_10_icon = "None"; // ["None", "Mickey", "Wand", "Castle", "Star", "Crown", "Heart", "Sparkle", "Ears", "Bow", "Paw"]

/* [Warna] */
base_color_name    = "Mickey Yellow"; // [Mickey Yellow, Magic Blue, Cinderella Blue, Royal Purple, Mickey Red, Princess Pink, Enchanted Gold, Minnie Red, Teal, Black, White]
letters_color_name = "White";         // [White, Gold, Magic Blue, Royal Purple, Mickey Red, Princess Pink, Black, Cinderella Blue, Teal, Minnie Red, Mickey Yellow]

/* [Settings] */
// Waltograph = font Disney yang sesungguhnya (bundled di project ini)
font_name        = "Waltograph"; // font [Waltograph]
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

/* [Layout Grid] */
bed_x = 235;
bed_y = 235;

gap_x = 10;
gap_y = 10;

slot_w = 60;
slot_h = 25;

/* [Direction/Alignment] */
rtl         = false;
text_halign = rtl ? "right" : "left";

/* ===============================
   COLOR MAPPING - Disney Palette
   =============================== */
function getColor(name) =
    name == "Mickey Yellow"   ? "#FFD700" :
    name == "Magic Blue"      ? "#1A78C2" :
    name == "Cinderella Blue" ? "#6AACE4" :
    name == "Royal Purple"    ? "#6A0DAD" :
    name == "Mickey Red"      ? "#CC1313" :
    name == "Princess Pink"   ? "#F8A7C7" :
    name == "Enchanted Gold"  ? "#D4AF37" :
    name == "Gold"            ? "#D4AF37" :
    name == "Minnie Red"      ? "#E8003D" :
    name == "Teal"            ? "#008080" :
    name == "Black"           ? "#111111" :
    name == "White"           ? "#FFFFFF" :
    "#FFD700";

base_color    = getColor(base_color_name);
letters_color = getColor(letters_color_name);

// -------------------------------------------------
// DISNEY VECTOR ICONS (100% CGAL Safe, MakerWorld)
// -------------------------------------------------

// Mickey Mouse head silhouette
module icon_mickey(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 4]) circle(r = 4.5, $fn = 32);
        translate([-3.8, 8.5]) circle(r = 2.6, $fn = 24);
        translate([3.8, 8.5]) circle(r = 2.6, $fn = 24);
    }
}

// Magic wand dengan bintang
module icon_wand(h = 10) {
    s = h / 13;
    scale([s, s]) {
        translate([0, 1]) {
            hull() {
                translate([-0.5, 0]) circle(r = 0.8, $fn = 12);
                translate([0.5, 7]) circle(r = 0.6, $fn = 12);
            }
            translate([0.5, 7]) {
                r_out = 2.5;
                r_in  = r_out * 0.42;
                for (i = [0:4]) {
                    hull() {
                        circle(r = r_in * 0.5, $fn = 10);
                        rotate([0, 0, i * 72 + 90]) translate([r_out, 0]) circle(r = 0.4, $fn = 8);
                    }
                }
            }
            translate([2.8, 9]) circle(r = 0.5, $fn = 8);
            translate([-2.0, 8.5]) circle(r = 0.4, $fn = 8);
            translate([1.5, 11.2]) circle(r = 0.35, $fn = 8);
        }
    }
}

// Disney Castle siluet
module icon_castle(h = 10) {
    s = h / 13;
    scale([s, s]) {
        translate([0, 0.5]) {
            translate([-4, 0]) square([8, 5]);
            translate([-4, 5]) square([2.2, 4]);
            translate([-4, 9]) square([0.8, 1.2]);
            translate([-2.8, 9]) square([0.8, 1.2]);
            translate([1.8, 5]) square([2.2, 4]);
            translate([1.8, 9]) square([0.8, 1.2]);
            translate([3.0, 9]) square([0.8, 1.2]);
            translate([-1.3, 4]) square([2.6, 6]);
            translate([-1.3, 10]) square([0.9, 1.5]);
            translate([0.4, 10]) square([0.9, 1.5]);
            translate([0, 1]) {
                hull() {
                    translate([-1.2, 0]) square([2.4, 0.1]);
                    circle(r = 1.2, $fn = 16);
                }
            }
        }
    }
}

// Bintang Disney
module icon_star(h = 10) {
    r_out = h / 2;
    r_in  = r_out * 0.42;
    translate([0, r_out]) {
        for (i = [0:4]) {
            hull() {
                circle(r = r_in, $fn = 16);
                rotate([0, 0, i * 72 + 90]) translate([r_out, 0]) circle(r = 0.5, $fn = 12);
            }
        }
    }
}

// Mahkota princess
module icon_crown(h = 10) {
    s = h / 10;
    scale([s, s]) {
        translate([0, 0.5]) {
            hull() {
                translate([-4.5, 0]) square([9, 1.5]);
                translate([0, 7.5]) circle(r = 0.8, $fn = 16);
            }
            hull() {
                translate([-4.5, 0]) square([9, 1.5]);
                translate([-4.2, 6.5]) circle(r = 0.8, $fn = 16);
            }
            hull() {
                translate([-4.5, 0]) square([9, 1.5]);
                translate([4.2, 6.5]) circle(r = 0.8, $fn = 16);
            }
            translate([0, 5.5]) circle(r = 0.9, $fn = 12);
            translate([-2.8, 4.0]) circle(r = 0.65, $fn = 10);
            translate([2.8, 4.0]) circle(r = 0.65, $fn = 10);
        }
    }
}

// Hati Disney
module icon_heart(h = 10) {
    s = h / 9.5;
    scale([s, s]) {
        translate([0, 0.5]) {
            hull() {
                translate([-2.5, 6.5]) circle(r = 2.5, $fn = 24);
                translate([0, 1.2]) circle(r = 0.6, $fn = 16);
            }
            hull() {
                translate([2.5, 6.5]) circle(r = 2.5, $fn = 24);
                translate([0, 1.2]) circle(r = 0.6, $fn = 16);
            }
        }
    }
}

// Kilatan ajaib / sparkle (Tinkerbell)
module icon_sparkle(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 6]) {
            for (a = [0:90:270]) {
                rotate([0, 0, a]) {
                    hull() {
                        circle(r = 0.6, $fn = 10);
                        translate([4.5, 0]) circle(r = 0.2, $fn = 8);
                    }
                }
            }
            for (a = [45:90:315]) {
                rotate([0, 0, a]) {
                    hull() {
                        circle(r = 0.4, $fn = 8);
                        translate([2.8, 0]) circle(r = 0.15, $fn = 6);
                    }
                }
            }
            circle(r = 1.0, $fn = 16);
            translate([3.5, 3.5]) circle(r = 0.45, $fn = 8);
            translate([-3.0, 3.2]) circle(r = 0.35, $fn = 8);
            translate([2.8, -3.2]) circle(r = 0.3, $fn = 8);
        }
    }
}

// Telinga Mickey
module icon_ears(h = 10) {
    s = h / 10;
    scale([s, s]) {
        translate([0, 2]) circle(r = 3.5, $fn = 28);
        translate([-3.0, 5.8]) circle(r = 2.2, $fn = 22);
        translate([3.0, 5.8]) circle(r = 2.2, $fn = 22);
    }
}

// Pita Minnie Mouse
module icon_bow(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            translate([0, 5.5]) circle(r = 1.3, $fn = 20);
            hull() {
                translate([0, 5.5]) circle(r = 0.9, $fn = 16);
                translate([-4.2, 7.2]) circle(r = 2.2, $fn = 20);
                translate([-4.2, 3.8]) circle(r = 2.0, $fn = 20);
            }
            hull() {
                translate([0, 5.5]) circle(r = 0.9, $fn = 16);
                translate([4.2, 7.2]) circle(r = 2.2, $fn = 20);
                translate([4.2, 3.8]) circle(r = 2.0, $fn = 20);
            }
            hull() {
                translate([0, 5.0]) circle(r = 0.7, $fn = 12);
                translate([-2.5, 1.5]) circle(r = 0.7, $fn = 12);
            }
            hull() {
                translate([0, 5.0]) circle(r = 0.7, $fn = 12);
                translate([2.5, 1.5]) circle(r = 0.7, $fn = 12);
            }
        }
    }
}

// Paw Disney
module icon_paw(h = 10) {
    s = h / 12;
    scale([s, s]) {
        translate([0, 1]) {
            hull() {
                translate([0, 3.5]) circle(r = 2.8, $fn = 24);
                translate([-2, 2]) circle(r = 1.6, $fn = 20);
                translate([2, 2]) circle(r = 1.6, $fn = 20);
            }
            translate([-3.3, 7.5]) circle(r = 1.0, $fn = 16);
            translate([-1.3, 9.2]) circle(r = 1.1, $fn = 16);
            translate([1.3, 9.2]) circle(r = 1.1, $fn = 16);
            translate([3.3, 7.5]) circle(r = 1.0, $fn = 16);
        }
    }
}

module draw_icon(name, size = 10) {
    offset_x = size * 0.42;
    if (name == "Mickey") {
        translate([offset_x, 0, 0]) icon_mickey(size);
    } else if (name == "Wand") {
        translate([offset_x, 0, 0]) icon_wand(size);
    } else if (name == "Castle") {
        translate([offset_x, 0, 0]) icon_castle(size);
    } else if (name == "Star") {
        translate([offset_x, 0, 0]) icon_star(size);
    } else if (name == "Crown") {
        translate([offset_x, 0, 0]) icon_crown(size);
    } else if (name == "Heart") {
        translate([offset_x, 0, 0]) icon_heart(size);
    } else if (name == "Sparkle") {
        translate([offset_x, 0, 0]) icon_sparkle(size);
    } else if (name == "Ears") {
        translate([offset_x, 0, 0]) icon_ears(size);
    } else if (name == "Bow") {
        translate([offset_x, 0, 0]) icon_bow(size);
    } else if (name == "Paw") {
        translate([offset_x, 0, 0]) icon_paw(size);
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
    has_emoji_or_symbol(word) ? "Star" :
    "None";

// -------------------------------------------------
// CHARACTER WIDTH TABLE - Waltograph (Disney script)
// Waltograph adalah font cursive/script dengan lebar
// huruf bervariasi (kapital lebih lebar dari lowercase)
// -------------------------------------------------
function char_w_val(c) =
    c=="A" ? 1.00 : c=="B" ? 0.88 : c=="C" ? 0.94 :
    c=="D" ? 0.96 : c=="E" ? 0.82 : c=="F" ? 0.78 :
    c=="G" ? 0.96 : c=="H" ? 0.94 : c=="I" ? 0.62 :
    c=="J" ? 0.72 : c=="K" ? 0.92 : c=="L" ? 0.80 :
    c=="M" ? 1.14 : c=="N" ? 0.98 : c=="O" ? 1.00 :
    c=="P" ? 1.04 : c=="Q" ? 1.00 : c=="R" ? 0.96 :
    c=="S" ? 0.88 : c=="T" ? 0.80 : c=="U" ? 0.94 :
    c=="V" ? 0.90 : c=="W" ? 1.20 : c=="X" ? 0.88 :
    c=="Y" ? 0.86 : c=="Z" ? 0.86 :
    c=="a" ? 0.74 : c=="b" ? 0.76 : c=="c" ? 0.68 :
    c=="d" ? 0.78 : c=="e" ? 0.72 : c=="f" ? 0.56 :
    c=="g" ? 0.78 : c=="h" ? 0.76 : c=="i" ? 0.34 :
    c=="j" ? 0.38 : c=="k" ? 0.78 : c=="l" ? 0.34 :
    c=="m" ? 1.06 : c=="n" ? 0.76 : c=="o" ? 0.76 :
    c=="p" ? 0.78 : c=="q" ? 0.78 : c=="r" ? 0.60 :
    c=="s" ? 0.70 : c=="t" ? 0.58 : c=="u" ? 0.78 :
    c=="v" ? 0.72 : c=="w" ? 1.04 : c=="x" ? 0.72 :
    c=="y" ? 0.72 : c=="z" ? 0.72 :
    c=="." ? 0.38 : c=="!" ? 0.44 : c=="?" ? 0.72 :
    c=="-" ? 0.48 : c=="'" ? 0.32 :
    ord(c)==194 ? 0.18 : ord(c)==176 ? 0.18 :
    c==" " ? 0.46 : 0.78;

function sum_char_w(str_val, idx=0) =
    idx >= len(str_val) ? 0 :
    char_w_val(str_val[idx]) + sum_char_w(str_val, idx+1);

function get_raw_word_width(word) =
    let(cleaned = clean_text(word))
    sum_char_w(cleaned) * letter_height;

module render_text_and_icon(text_string, icon_name = "None") {
    effective_icon = resolve_icon(text_string, icon_name);
    cleaned = clean_text(text_string);
    word_w  = get_raw_word_width(text_string);

    if (cleaned != "") {
        text(
            cleaned,
            size   = letter_height,
            font   = font_name,
            halign = text_halign,
            valign = "baseline"
        );
    }
    if (effective_icon != "None") {
        translate([word_w, 0, 0])
            draw_icon(effective_icon, size = letter_height * 0.9);
    }
}

/* ===============================
   MODULES
   =============================== */
module base_with_tunnel(text_string, icon_name = "None") {
    difference() {
        linear_extrude(height = base_height)
            offset(delta = outline_margin)
                render_text_and_icon(text_string, icon_name);

        if (hole_orientation == "FRONTBACK") {
            translate([ 0, hole_y, hole_z ])
                rotate([ 0, 90, 0 ])
                    cylinder(d = hole_diameter, h = hole_length, center = true, $fn = 100);
        }
        else if (hole_orientation == "TOPBOTTOM") {
            translate([ hole_x, 0, hole_z ])
                rotate([ 90, 0, 0 ])
                    cylinder(d = hole_diameter, h = hole_length, center = true, $fn = 100);
        }
        else {
            echo("Error: hole_orientation must be FRONTBACK or TOPBOTTOM.");
        }
    }
}

module raised_letters(text_string, icon_name = "None") {
    translate([ 0, 0, base_height ])
        linear_extrude(height = letter_thickness)
            render_text_and_icon(text_string, icon_name);
}

module name_topper(text_string, icon_name = "None") {
    color(base_color)    base_with_tunnel(text_string, icon_name);
    color(letters_color) raised_letters(text_string, icon_name);
}

/* ===============================
   GENERATE - grid layout, center di bed
   =============================== */
nama_all = [
    nama_1, nama_2, nama_3, nama_4, nama_5,
    nama_6, nama_7, nama_8, nama_9, nama_10
];

icon_all = [
    nama_1_icon, nama_2_icon, nama_3_icon, nama_4_icon, nama_5_icon,
    nama_6_icon, nama_7_icon, nama_8_icon, nama_9_icon, nama_10_icon
];

active_indices = [for (i = [0:9]) if (nama_all[i] != "") i];
total          = len(active_indices);

grid_rows = ceil(total / grid_cols);

total_w = grid_cols * slot_w + (grid_cols - 1) * gap_x;
total_h = grid_rows * slot_h + (grid_rows - 1) * gap_y;

start_x = (bed_x - total_w) / 2;
start_y = (bed_y - total_h) / 2;

if (total > 0) {
    for (idx = [0 : total - 1]) {
        i   = active_indices[idx];
        col = idx % grid_cols;
        row = floor(idx / grid_cols);

        x = start_x + col * (slot_w + gap_x);
        y = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);

        translate([ x, y, 0 ])
            name_topper(nama_all[i], icon_all[i]);
    }
}
