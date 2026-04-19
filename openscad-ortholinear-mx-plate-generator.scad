two_dimentional = false;
thickness       = 1.5;

cols        = 5; 
rows        = 4;

hole_w      = 13.8;  
hole_h      = 13.8; // remove commment once confirmed

outer_border_x    = 0;
outer_border_y    = 0;

spacer_w    = 5.5;  // remove commment once confirmed
spacer_h    = 5;    // remove commment once confirmed

plate_w     = spacer_w + ( cols * (spacer_w + hole_w) + outer_border_x * 2);
plate_h     = spacer_h + ( rows * (spacer_h + hole_h) + outer_border_y * 2); 

plate_size  = [plate_w,plate_h,thickness];
hole_size   = [hole_w, hole_h, thickness * 3];

module generate_3d_plate(){
    difference(){
        cube(plate_size, center =   false);
        
        for (row = [0:rows-1]) {
            for (col = [0:cols-1]) {
                translate(
                    [ outer_border_x + spacer_w + (spacer_w * col) + (hole_w * col),
                      outer_border_y + spacer_h + (spacer_h * row) + (hole_h * row),
                      -1 ]
                )
                    cube(hole_size, center = false);
            }
        }        
    }
}

module generate_2d_plate(){
    difference(){
        plate_size2 = [plate_size[0], plate_size[1]];
        hole_size2  = [hole_size[0],  hole_size[1] ];
        
        square(plate_size2, center =   false);
        
        for (row = [0:rows-1]) {
            for (col = [0:cols-1]) {
                translate(
                    [ outer_border_x + spacer_w + (spacer_w * col) + (hole_w * col),
                      outer_border_y + spacer_h + (spacer_h * row) + (hole_h * row)]
                )
                    square(hole_size2, center = false);
            }
        }        
    }
}

if (two_dimentional){
    generate_2d_plate();
} else {
    generate_3d_plate();
}

// made by Rebekah Hellberg [insert witty line about it not having been vibe coded]