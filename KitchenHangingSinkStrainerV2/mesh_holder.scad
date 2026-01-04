// https://openscad.org/cheatsheet/

module mesh_holder(){
    length = 140;
    height = 5;
    pin_radious = 2;
    
    module mesh_holder_frame(length, height){
        union() {
            cube([length, 20, height]);
            cube([20, length, height]);
        }
    }
        
    module pin(height){
        union(){
            cylinder(h=height - 3, r=pin_radious + 2);
            cylinder(h=height, r=pin_radious + 1);
            cylinder(h=height + height, r=pin_radious);
        }
    }

    module pin_hole(height, x, y){
        translate([x, y, 0]) { 
            pin(height);
        }
    }
        
    module mesh_holder_core(length, height){
        difference(){
            mesh_holder_frame(length, height);
            
            hole_locations = [
                [40, 10],
                [70, 10],
                [100, 10],
                [130, 10],
            
                [10, 40],
                [10, 70],
                [10, 100],
                [10, 130],
            ];
            
            for (hole_loc = hole_locations){
                translate([0, 0, -height]){
                    pin_hole(height, hole_loc[0], hole_loc[1]);
                }
            }
        }
    }
        
    module brim(length, height){
        cube([4, length, height * 2]);
    }
    
    module clip(){
        union(){
            translate([-5, 40, 0]){
                cube([5, 10, 4]);
            };
            
            translate([-5, 40, 0]){
                cube([5, 10, 4]);
            };
        }
    }
    
    union(){
        mesh_holder_core(length, height);
        //brim(length, height);
        //clip();
        
        translate([50, 50, 0]){
            pin(height);
        }
        
        translate([60, 50, 0]){
            pin(height);
        }
        
        translate([70, 50, 0]){
            pin(height);
        }
        
        translate([80, 50, 0]){
            pin(height);
        }
        
        translate([50, 60, 0]){
            pin(height);
        }
        
        translate([50, 70, 0]){
            pin(height);
        }
        
        translate([50, 80, 0]){
            pin(height);
        }
        
        translate([50, 90, 0]){
            pin(height);
        }
    }
}

mesh_holder();