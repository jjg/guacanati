pit=10;

difference(){
    
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

// pit
sphere(r=pit/2,h=5,$fn=(pit*5));