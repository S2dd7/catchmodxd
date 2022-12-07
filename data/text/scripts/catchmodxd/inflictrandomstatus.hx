//Simple general use "inflict random status" script that works the same way everywhere
//Returns the status as a string in case you need to use it for attacks
//If you want to add your statuses, do it
var _target = args[0];
var _amount = args[1];
var adddelay = args[2]; //Add a 0.2 second delay for cases where we're also inflicting damage
var inflict = args[3];

var randstatus = "";

if(_amount == ALL){
  //Only include statuses that have a limit
  if(_target.isplayer){
    randstatus = rand(["fire", "ice", "weaken", "shock", "blind"]);
  } else {
    //Include lock if you're player :smore:
    randstatus = rand(["lock", "fire", "ice", "weaken", "shock"]);
  }
} else {
  if(_target.isplayer){
    randstatus = rand(["curse", "lock", "fire", "ice", "weaken", "shock", "poison"]);
  } else {
    randstatus = rand(["curse", "lock", "fire", "ice", "weaken", "shock", "poison"]);
  }
}
inflict(randstatus, _amount); 
if(adddelay){
  sfx("_" + randstatus.toLowerCase(), "", 0.2);
}else{
  sfx("_" + randstatus.toLowerCase());
}

return randstatus;