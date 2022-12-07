var f = args[0];
var amt = args[1];

trace("doing bumpnextturn!");

if(amt == 0) { trace("bumpnextturn script was called with 0!"); }

var addamt = 1;
if(amt < 0) {
	addamt = -1;
	amt *= -1;
}

var extradice = [];
var removedice = [];
var availdice = [for(dice in f.dicepool) if(dice.available() && !dice.intween()) dice];
var dicetobump_dice = [];
var dicetobump_values = [];
shuffle(availdice);

var playsfx = false;
var c = 0;

while(amt > 0) {
	if(availdice.length == 0) break;
	for(dice in availdice) {
		if(removedice.length > 0 && removedice.indexOf(dice) != -1) continue;
		if(addamt < 0 && addamt + dice.basevalue <= 0) {
			removedice.push(dice);
			playsfx = true;
		}
		else {
			var diceindex = dicetobump_dice.indexOf(dice);
			if(diceindex == -1) {
				dicetobump_dice.push(dice);
				dicetobump_values.push(addamt);
			}
			else {
				dicetobump_values[diceindex] += addamt;
			}
		}
		amt--;
		if(amt == 0) break;
	}
	if(removedice.length > 0) for(dice in removedice) {
		availdice.remove(dice);
	}
	shuffle(availdice);
}
if(removedice.length > 0) for(dice in removedice) {
	dice.removedice(f.screenposition());
}

if(dicetobump_dice.length > 0) {
	var i = 0;
	for(i in 0...dicetobump_dice.length) {
		var thisaddamt = dicetobump_values[i];
		var thisdice = dicetobump_dice[i];
		trace(thisdice.basevalue);
		trace(thisaddamt);
		trace("----");
		if(thisaddamt + thisdice.basevalue > 6) {
			thisdice.animatereroll(6, f.screenposition(), c * 0.05);
			c++;
			if(addamt + thisdice.basevalue > 6) {
				extradice.push((addamt + thisdice.basevalue) - 6);
			}
			for(ii in 0...(thisaddamt / addamt)) {
				if(ii == 0) continue;
				extradice.push(addamt);
			}
			playsfx = true;
		}
		else {
			thisdice.animatereroll(thisdice.basevalue + thisaddamt, f.screenposition(), c * 0.05);
			c++;
			playsfx = true;
		}
	}
}

givedice(extradice);
if(playsfx) { sfx("diceroll"); }