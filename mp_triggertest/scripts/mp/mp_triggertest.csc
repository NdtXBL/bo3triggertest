#using scripts\codescripts\struct;
#using scripts\shared\util_shared;
#using scripts\mp\_load;
#using scripts\mp\_util;
#using scripts\mp\mp_triggertest_fx;
#using scripts\mp\mp_triggertest_sound;

#insert scripts\shared\shared.gsh;

function main()
{
	mp_triggertest_fx::main();
	mp_triggertest_sound::main();
	
	load::main();

	util::waitforclient( 0 );	// This needs to be called after all systems have been registered.
}
