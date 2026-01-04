module jig() {
    t_height = 5;
    t_offset = 100;
    t_width = 100;
    
    t_leap = t_width / 5;
    
    
    cube([t_leap, t_offset, t_height]);
    translate([t_width - t_leap, 0, 0])
    {
        cube([t_leap, t_offset, t_height]);
    }
    cube([t_width, t_leap / 2, t_height * 2]);
}


jig();
