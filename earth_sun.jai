#import "Basic";



main :: () {

    earth_x := 1.0;
    earth_y := 1.0;
    earth_z := 0.0;
    
    speed_x := -0.1;
    speed_y := 0.1;
    speed_z := 0.0;

    dt := 0.01;

    time_passed := 0.0;

    G := 0.9;

    force_x := 0.0;
    force_y := 0.0;
    force_z := 0.0;

    builder: String_Builder;

    init_string_builder(*builder);

    append(*builder, "time_passed,");
    append(*builder, "earth_x,");
    append(*builder, "earth_y,");
    append(*builder, "earth_z,");
    append(*builder, "force_factor,\n");


    
    for 0..2000 {


        distance_squared := earth_x * earth_x  + earth_y * earth_y + earth_z * earth_z;
        force_factor := G / distance_squared;
        assert(distance_squared > 0);

        //always in the negative direction, now it finally makes sense.
        force_x = - earth_x * force_factor;
        force_y = - earth_y * force_factor;
        force_z = - earth_z * force_factor;

        speed_x += dt * force_x;
        speed_y += dt * force_y;
        speed_z += dt * force_z;

        earth_x += dt * speed_x;
        earth_y += dt * speed_y;
        earth_z += dt * speed_z;

        time_passed += dt;

        append(*builder, sprint("%,", time_passed));
        append(*builder, sprint("%,", earth_x));
        append(*builder, sprint("%,", earth_y));
        append(*builder, sprint("%,", earth_z));
        append(*builder, sprint("%,\n", force_factor));
    }

    #import "File";
    write_entire_file("my_newton_data.txt", *builder);
}



//code for spring:
/*
for 0..2000 {

    force = - distance;

    speed += dt * force;

    position += dt * speed;

    kinetic_energy = speed * speed;
    potential_energy = position * position;

    lagrangian = kinetic_energy - potential_energy;

}
*/