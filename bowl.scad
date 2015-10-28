pit=10;

// center bowl around pyramid, not pit
translate([0,5,0]){
    // bowl
    difference(){
        // bowl outer shape
        translate([0,0,pit*5]){
            resize([pit*15,pit*15,pit*10]){
                sphere(pit*5,$fn=(pit*10));
            }
        }

        // cut-off top
        translate([-(pit*15)/2,-(pit*15)/2,pit*5]){
            cube([pit*15,pit*15,pit*5]);
        }
        
        // hollow
        translate([0,0,pit*6.1]){
            resize([pit*15,pit*15,pit*12]){
                sphere(pit*5,$fn=(pit*10));
            }
        }
    }
}

union(){
    difference(){
  
        // pyramid
        linear_extrude(height=5){
            polygon(
                points=[[-(pit*2.7),-pit], [0,(pit*2.8)], [(pit*2.7),-pit]],
                faces=[[0,1,2]]
             );
        }
        
        // avocado cut-out
        translate([0,1,1]){
            hull(){
                translate([0,(pit*1.5),0]){
                    cylinder(r=pit/2,h=5,$fn=(pit*5));
                }
                cylinder(r=pit,h=5,$fn=(pit*5));
            }
        }      
    }
/*
        // pyramid
        linear_extrude(height=5){
            polygon(
                points=[[-(pit*2.5),-pit], [0,(pit*2.5)], [(pit*2.5),-pit]],
                faces=[[0,1,2]]
             );
        }
        
        // avocado cut-out
        translate([0,0,1]){
            hull(){
                translate([0,(pit*1.5),0]){
                    cylinder(r=pit/2,h=5,$fn=(pit*5));
                }
                cylinder(r=pit,h=5,$fn=(pit*5));
            }
        }
    }
*/
    // pit
    difference(){
        sphere(r=pit/2,h=5,$fn=(pit*5));
        
        // cut-off the bottom
        translate([-pit,-pit,-pit]){
            #cube([pit*2,pit*2,pit]);
        }
    }
}