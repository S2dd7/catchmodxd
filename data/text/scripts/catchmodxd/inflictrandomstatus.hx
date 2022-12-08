//Simple general use "inflict random status" script that works the same way everywhere
//Returns the status as a string in case you need to use it for attacks
//If you want to add your statuses, do it
var _target = args[0];
var _amount = args[1];
var adddelay = args[2]; //Add a 0.2 second delay for cases where we're also inflicting damage
var inflict = args[3];

var randstatus = "";

//Only include statuses that have a limit
var pool_all_player = ["fire", "ice", "weaken", "shock", "blind", "vanish"];
//Include lock if you're player :smore:
var pool_all_target = ["lock", "fire", "ice", "weaken", "shock", "vanish"];
var pool_player = ["curse", "lock", "fire", "ice", "weaken", "shock", "poison", "blind", "fade", "nudgenextturn"];
var pool_target = ["curse", "lock", "fire", "ice", "weaken", "shock", "poison", "fade", "nudgenextturn"];

var pool = null;

if(_amount == ALL){
  
  if(_target.isplayer){
    pool = pool_all_player;
  } else {
    pool = pool_all_target;
  }
} else {
  if(_target.isplayer){
    pool = pool_player;
  } else {
    pool = pool_target;
  }
  
  
  if(_amount <= 6) {
    pool.push("counter");
  }
}


randstatus = rand(pool);
if(randstatus == "vanish") { _amount = 1; }

if(randstatus != "counter") {
  inflict(randstatus, _amount);
} else {
  inflict(randstatus + "_" + amount);
}
if(adddelay){
  sfx("_" + randstatus.toLowerCase(), "", 0.2);
}else{
  sfx("_" + randstatus.toLowerCase());
}

return randstatus;