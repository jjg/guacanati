pit=10;

difference(){
    
    // pyramid
    linear_extrude(height=5){
        polygon(
            points=[[-(pit*2.7),-pit], [0,(pit*2.7)], [(pit*2.7),-pit]],
            faces=[[0,1,2]]
         );
    }
    
    // avocado cut-out
    translate([0,0.5,1]){
        hull(){
            translate([0,(pit*1.5),0]){
                cylinder(r=pit/2,h=5,$fn=(pit*5));
            }
            cylinder(r=pit,h=5,$fn=(pit*5));
        }
    }
    
    // necklace hole
    translate([-10,(pit*2.3),2.5]){
        rotate([0,90,0]){
            cylinder(r=1.5,h=20,$fn=20);
        }
    }
}

// pit
difference(){
    sphere(r=pit/2,h=5,$fn=(pit*5));
    // pit cut-off
    translate([-pit*2.5,-pit,-5]){
       cube([pit*5,pit*5,5]);
    }
}
/*
translate([0,(pit*2.5),0]){
    difference(){
        cylinder(r=(pit/2),h=5,$fn=(pit*5));
        translate([0,0,-1]){
            cylinder(r=(pit/2.5),h=7,$fn=(pit*5));
        }
    }
}
*/