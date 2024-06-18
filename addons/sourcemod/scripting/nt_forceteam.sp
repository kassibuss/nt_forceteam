#include <sourcemod>
#include <sdktools>

public Plugin myinfo = {  
  name = "Force to Team",
  description = "Use commands to force a player to join a team",
  author = "kinoko",
  version = "0.1.0",
  url = "",
};

public OnPluginStart()
{
  RegAdminCmd("sm_nf", Command_NSFForce, ADMFLAG_GENERIC);
  RegAdminCmd("sm_jf", Command_JinraiForce, ADMFLAG_GENERIC)
  RegAdminCmd("sm_sf", Command_SpecForce, ADMFLAG_GENERIC)  
}

public Action Command_NSFForce(int client, int args)
{
  char arg1[32];

  GetCmdArg(1, arg1, sizeof(arg1));

  int target = FindTarget(client, arg1);
  if (target == -1)
  {
    return Plugin_Handled;
  }

  FakeClientCommand(client, "kill");
  FakeClientCommand(client, "jointeam 3");
  ReplyToCommand(client, "%N has been moved to NSF");

  return Plugin_Handled;
}

public Action Command_JinraiForce(int client, int args)
{
  char arg1[32];

  GetCmdArg(1, arg1, sizeof(arg1));

  int target = FindTarget(client, arg1);
  if (target == -1)
  {
    return Plugin_Handled;
  }

  FakeClientCommand(client, "kill"); 
  FakeClientCommand(client, "jointeam 2");
  ReplyToCommand(client, "%N has been moved to Jinrai");

  return Plugin_Handled;
}

public Action Command_SpecForce(int client, int args)
{
  char arg1[32];

  GetCmdArg(1, arg1, sizeof(arg1));

  int target = FindTarget(client, arg1);
  if (target == -1)
  {
    return Plugin_Handled;
  }

  FakeClientCommand(client, "kill"); 
  FakeClientCommand(client, "jointeam 1");
  ReplyToCommand(client, "%N has been moved to Spectators");

  return Plugin_Handled;
}
