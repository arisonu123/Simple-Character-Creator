/*Alison Taylor
10/08/2012
cBehaviors-Links cBehaviors and Lua charCreator script,prints additional behavior messsages depending on which behavior(attack,defend
,heal) that the user chooses to simulate*/


#include <stdlib.h> /* C standard library */

extern "C" { /* Lua C API */
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}

using namespace std;

/* C++ function to be called by Lua behavior module */
static int CBehaviors(lua_State *L) {
	/* get function argument from lua */
	int args = lua_gettop(L); /* get nbr of arguments passed off stack, should be 1 */

	/* get first function argument off stack */
	/* convert to a C/C++ compatible number */
	int behavior = lua_tonumber(L, args);
	char* output; /* C string to hold the output Lua will get */

	/* decide behavior */
	if (behavior == 1)
		output = "I am now attacking my enemies\n";
	else if (behavior == 2)
		output = "I am now defending against my enemies\n";
	else if (behavior == 3)
		output = "I am now healing from my wounds\n";
	else
		output = "Invalid argument to C function call\n";

	/* push output string onto the C/Lua stack in Lua compatible format */
	lua_pushstring(L, output);
	/* return to Lua number of parameters on stack */
	return 1;
}

int main(void) {
	lua_State *L = lua_open(); /* opens lua interpreter */
	luaL_openlibs(L);	   /* load Lua standard libraries */

	/* register C++ function with Lua */
	lua_register(L, "CBehaviors", CBehaviors);

	/* run the Lua script, which will use the Lua behavior module by require function */
	luaL_dofile(L, "charCreator.lua");

	/* cleanup Lua */
	lua_close(L);

	/* hold command prompt open */
	system("pause");
	return 0;
}