#using scripts\codescripts\struct;
#using scripts\shared\util_shared;
#using scripts\mp\_load;
#using scripts\mp\_util;
#using scripts\mp\mp_triggertest_fx;
#using scripts\mp\mp_triggertest_sound;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;

function main()
{
	precache();
	
	mp_triggertest_fx::main();
	mp_triggertest_sound::main();
	
	load::main();

	SetDvar( "compassmaxrange", "2100" );	// Set up the default range of the compass

	level thread tm_example();
	level thread tu_example();
	level thread tut_example();
	level thread td_example();
	level thread tb_example();
	level thread tr_example();
	level thread tl_example();
	level thread to_example();
	level thread tu_manip1();
	level thread tm_manip2();
	level thread tm_tele1();
	level thread tm_mnp1();
	level thread tm_mnp2();
	level thread tu_resetobjectives();
	level thread objective_checker();
}

function precache()
{
	// DO ALL PRECACHING HERE
}

//triggers, tm=multiple, tu=use, td=damage, tl=lookat, to=once, tb=box, tr=radius, tut=use touch
//trigger names: tu_example, tm_example, td_example, to_example, tl_example, tb_example, tr_radius, tut_example, tu_manip1, tm_manip2, tm_tele1, tm_mnp1, tm_mnp2, tu_resetobjectives

function tm_example()
{
	trig = GetEnt("tm_example", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Multiple Triggered!!");
		wait(0.1);
	}
}

function tb_example()
{
	trig = GetEnt("tb_example", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Box Triggered!!");
		wait(0.1);
	}
}

function tr_example()
{
	trig = GetEnt("tr_example", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Radius Triggered!!");
		wait(0.1);
	}
}

function tu_example()
{
	trig = GetEnt("tu_example", "targetname");
	trig SetCursorHint("HINT_NOICON");
    trig SetHintString("Hold &&1 to trigger");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Use Triggered!!");
		wait(0.1);
	}
}

function tut_example()
{
	trig = GetEnt("tut_example", "targetname");
	trig SetCursorHint("HINT_ACTIVATE");
    trig SetHintString("Hold &&1 to trigger");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Use Touch Triggered!!");
		wait(0.1);
	}
}

function td_example()
{
	trig = GetEnt("td_example", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Damage Triggered!!");
		wait(0.1);
	}
}

function tl_example()
{
	trig = GetEnt("tl_example", "targetname");
	while(1)
	{
		//trig waittill("trigger", player);
		//IPrintLn("^6TRIGGER DEBUG: ^3Trigger Lookat Triggered!!");
		if(level.players[0] player_is_looking_at_entity(trig))
		{
			IPrintLn("^6TRIGGER DEBUG: ^3Trigger Lookat Triggered!!");
		}
		wait(0.1);
	}
}

function to_example()
{
	trig = GetEnt("to_example", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Trigger Once Triggered!!");
		wait(0.1);
	}
}

function tu_manip1()
{
	trig = GetEnt("tu_manip1", "targetname");
	trig SetHintString("^2Hold &&1 to activate objective_b");
    trig SetCursorHint("HINT_NOICON");
	while(1)
	{
		trig waittill("trigger", player);
		if(!level.objective_b)
		{
			level.trigger_objective_b = 1;
		}
		wait(0.1);
	}
}

function tm_manip2()
{
	trig = GetEnt("tm_manip2", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		if(!level.objective_c)
		{
			level.trigger_objective_c = 1;
		}
		wait(0.1);
	}
}

function tm_mnp1()
{
	trig = GetEnt("tm_mnp1", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		if(!level.objective_1)
		{
			level.trigger_objective_1 = 1;
		}
		wait(0.1);
	}
}

function tm_mnp2()
{
	trig = GetEnt("tm_mnp2", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		if(!level.objective_2)
		{
			level.trigger_objective_2 = 1;
		}
		wait(0.1);
	}
}

function tm_tele1()
{
	trig = GetEnt("tm_tele1", "targetname");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Teleported!!");
		originent = GetEnt("brickroom", "targetname");
		originc = originent.origin;
		player SetOrigin(originc);
		wait(0.1);
	}
}

function tu_resetobjectives()
{
	trig = GetEnt("tu_resetobjectives", "targetname");
	trig SetHintString("Hold &&1 to reset all objectives");
    trig SetCursorHint("HINT_NOICON");
	while(1)
	{
		trig waittill("trigger", player);
		IPrintLn("^6TRIGGER DEBUG: ^3Reset Objectives!!");
		level.objective_b = 0;
		level.trigger_objective_b = 0;
		level.objective_b_said = 0;
		level.objective_c = 0;
		level.trigger_objective_c = 0;
		level.objective_c_said = 0;
		level.objective_1 = 0;
		level.trigger_objective_1 = 0;
		level.objective_1_said = 0;
		level.objective_2 = 0;
		level.trigger_objective_2 = 0;
		level.objective_2_said = 0;
		wait(0.1);
	}
}


function objective_checker()
{
	while(1)
	{
		if(level.trigger_objective_b && !level.objective_b_said)
		{
			level.objective_b_said = 1;
			IPrintLn("^1Objective_b set!!");
			level.objective_b = 1;
		}
		if(level.trigger_objective_c && !level.objective_c_said && level.trigger_objective_b)
		{
			level.objective_c_said = 1;
			IPrintLn("^1Objective_c set!!");
			level.objective_c = 1;
		}
		if(level.trigger_objective_1 && !level.objective_1_said)
		{
			level.objective_1_said = 1;
			IPrintLn("^1Objective_1 set!!");
			level.objective_1 = 1;
		}
		if(level.trigger_objective_2 && !level.objective_2_said && level.trigger_objective_1)
		{
			level.objective_2_said = 1;
			IPrintLn("^1Objective_2 set!!");
			level.objective_2 = 1;
		}
		wait(0.1);
	}
}

function player_is_looking_at_entity(entity, b_do_trace = false)
{
	if (IsDefined(entity) && IsString(entity)) {
		entity = GetEnt(entity, "targetname");
	}
	if (!IsDefined(entity)) {
		return false;
	}
	if (!IsPlayer(self) || !IsAlive(self)) {
		return false;
	}

	v_ray_origin = self util::get_eye();

	if (b_do_trace && !SightTracePassed(v_ray_origin, entity.origin, false, entity)) {
		return false;
	}

	v_ray_direction = AnglesToForward(self GetPlayerAngles());
	v_to_box = entity.origin - v_ray_origin;

	if (!IS_TRUE(entity.b_looking_data_stored)) {
		entity.v_forward = AnglesToForward(entity.angles);
	    entity.v_right = AnglesToRight(entity.angles);
	    entity.v_up = AnglesToUp(entity.angles);
	    entity.v_prev_angles = entity.angles;
		
		entity.v_dimensions = entity calculate_local_box_dimensions();

		entity.b_looking_data_stored = true;
	}
	else if (entity.angles != entity.v_prev_angles) {
		entity.v_forward = AnglesToForward(entity.angles);
	    entity.v_right = AnglesToRight(entity.angles);
	    entity.v_up = AnglesToUp(entity.angles);
	    entity.v_prev_angles = entity.angles;
	}

	v_direction_dots = (
		VectorDot(entity.v_forward, v_ray_direction),
		VectorDot(entity.v_right, v_ray_direction),
		VectorDot(entity.v_up, v_ray_direction)
	);
	v_position_dots = (
		VectorDot(entity.v_forward, v_to_box),
		VectorDot(entity.v_right, v_to_box),
		VectorDot(entity.v_up, v_to_box)
	);

	a_hit_times = [];
	for (i = 0; i < 3; i++) {
		if (v_direction_dots[i] == 0) {
			if ((-v_position_dots[i] - entity.v_dimensions[i]) > 0 || (-v_position_dots[i] + entity.v_dimensions[i]) < 0) {
				return false;
			}

			switch (i) {
				case 0: {
					v_direction_dots = (0.0001, v_direction_dots[1], v_direction_dots[2]);
					break;
				}
				case 1: {
					v_direction_dots = (v_direction_dots[0], 0.0001, v_direction_dots[2]);
					break;
				}
				case 2: {
					v_direction_dots = (v_direction_dots[0], v_direction_dots[1], 0.0001);
					break;
				}
				default: {
					break;
				}
			}
		}

		a_hit_times[i * 2 + 0] = (v_position_dots[i] + entity.v_dimensions[i]) / v_direction_dots[i];
		a_hit_times[i * 2 + 1] = (v_position_dots[i] - entity.v_dimensions[i]) / v_direction_dots[i];
	}

	n_min = Max(
	    Max(
	        Min(a_hit_times[0], a_hit_times[1]),
	        Min(a_hit_times[2], a_hit_times[3])
	    ),
	    Min(a_hit_times[4], a_hit_times[5])
	);

	n_max = Min(
	    Min(
	        Max(a_hit_times[0], a_hit_times[1]),
	        Max(a_hit_times[2], a_hit_times[3])
	    ),
	    Max(a_hit_times[4], a_hit_times[5])
	);

	return !(n_max < 0 || n_min > n_max);
}

function calculate_local_box_dimensions()
{
	v_box_min = self GetMins();
	v_box_max = self GetMaxs();
	// check fakeent
	n_ent_type = self GetEntityType();
	if (n_ent_type == ET_GENERAL || n_ent_type == ET_TRIGGER) {
		v_box_min = v_box_min + (1, 1, 1);
		v_box_max = v_box_max - (1, 1, 1);
	}

	n_half_width = (v_box_max[0] - v_box_min[0]) / 2;
    n_half_depth = (v_box_max[1] - v_box_min[1]) / 2;
    n_half_height = (v_box_max[2] - v_box_min[2]) / 2;

    if (IsDefined(self.script_width) && IsDefined(self.script_height) && IsDefined(self.script_depth)) {
		n_half_width = self.script_width / 2;
        n_half_depth = self.script_depth / 2;
        n_half_height = self.script_height / 2;
	}

	return (n_half_width, n_half_depth, n_half_height);
}