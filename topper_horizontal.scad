/* =====================================================
   Multi-Name Topper (FIX PERFECT CENTER)
   ===================================================== */

grid_cols = 2;
/* [Nama] */
/* [Nama] */
nama_1  = "Adi";
nama_1_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_2  = "";
nama_2_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_3  = "";
nama_3_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_4  = "";
nama_4_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_5  = "";
nama_5_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_6  = "";
nama_6_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_7  = "";
nama_7_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_8  = "";
nama_8_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_9  = "";
nama_9_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

nama_10 = "";
nama_10_icon = "None"; // ["None", "Anchor", "Heart", "Star", "Crown", "Paw", "Music", "Cat", "Moon", "Sun", "Flower", "Diamond", "Butterfly", "Ribbon", "Smile"]

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
    name == "Beige"        ? "#D9B99b" :
    name == "Barbie Pink"  ? "#FF69B4" :
    "#FFFFFF";

base_color    = getColor(base_color_name);
letters_color = getColor(letters_color_name);

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

// ─────────────────────────────────────────────
// EMOJI CLEANER & AUTO DETECT
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
    sum_char_w(cleaned) * letter_height;

module render_text_and_icon(text_string, icon_name = "None") {
    effective_icon = resolve_icon(text_string, icon_name);
    cleaned = clean_text(text_string);
    word_w  = get_raw_word_width(text_string);
    icon_w  = (effective_icon != "None") ? letter_height * 0.9 : 0;
    total_w = word_w + (icon_w > 0 ? icon_w + 2 : 0);

    translate([-total_w / 2, 0, 0]) {
        if (cleaned != "") {
            text(
                cleaned,
                size   = letter_height,
                font   = font_name,
                valign = "baseline"
            );
        }
        if (effective_icon != "None") {
            translate([word_w, 0, 0])
                draw_icon(effective_icon, size = letter_height * 0.9);
        }
    }
}

/* ===============================
   MODULES (CENTER FIX)
   =============================== */
module base_with_tunnel(text_string, icon_name = "None") {

    difference() {
        linear_extrude(height = base_height)
            offset(delta = outline_margin)
                render_text_and_icon(text_string, icon_name);

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
   GENERATE GRID
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

/* ===============================
   LOOP RENDER
   =============================== */
if (total > 0) {
    for (idx = [0 : total - 1]) {
        i   = active_indices[idx];
        col = idx % grid_cols;
        row = floor(idx / grid_cols);

        x = start_x + col * (slot_w + gap_x) + slot_w / 2;
        y = start_y + (grid_rows - 1 - row) * (slot_h + gap_y);

        translate([ x, y, 0 ])
            name_topper(nama_all[i], icon_all[i]);
    }
}