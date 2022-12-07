//by diane
//based on tennis's "dofloorshit" script (also by me)

var playername = args[0];
var floor1 = args[1];
var floor2 = args[2];
var floor3 = args[3];
var floor4 = args[4];
var floor5 = args[5];
var floor6 = args[6];
var finalboss = args[7];

//music kludge because progresssettings forces all floors to play either combat1 or combat4
//in vanilla there's "early" tracks that can play on floors 1 and 2: fittingly, combat1 and combat2.
//then there's "late" tracks that can play on floors 3, 4, and 5. which are combat3, combat4, and combat6 (combat5 is audrey's theme)
//the track that each floor plays is randomly picked, and the same track can show up twice
//but anyway, since we're manually setting combat themes here we can deviate from that
var floor1tracks = ["1", "2"];
var floor2tracks = ["1", "2"];
var floor3tracks = ["1", "2"];
var floor4tracks = ["2", "3"];
var floor5tracks = ["2", "3"];


floor1.theme = "music_cmx_combat" + rand(floor1tracks);
floor2.theme = "music_cmx_combat" + rand(floor2tracks);
floor3.theme = "music_cmx_combat" + rand(floor3tracks);
floor4.theme = "music_cmx_combat" + rand(floor4tracks);
floor5.theme = "music_cmx_combat" + rand(floor5tracks);

//deal with custom boss music stuff later
var bpc5 = loadtext("bosses_playing_combat5");
var bpc9 = loadtext("bosses_playing_combat9");
var bpcb = loadtext("bosses_playing_combatboss");

if(bpc5.indexOf(finalboss) != -1) floor6.theme = "music_combat5";
else if(bpc9.indexOf(finalboss) != -1) floor6.theme = "music_combat9";
else if(bpcb.indexOf(finalboss) != -1) floor6.theme = "music_combatboss";