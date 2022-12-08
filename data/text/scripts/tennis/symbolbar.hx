var e = args[0];
var sym1 = args[1]; // filled
var sym2 = args[2]; // unfilled
var value = args[3];
var total = args[4];

var tempdesc = e.fulldescription.split("[funnysymbol]");
e.fulldescription = tempdesc[0];
e.fulldescription += "[funnysymbol]";
if (value > 0) {
  for (i in 0...(value <= total ? value : total)) {
    e.fulldescription += "["+sym1+"]";
  }
}
if (value < total) {
  for (i in value...total) {
    e.fulldescription += "["+sym2+"]";
  }
}
e.fulldescription += "[funnysymbol]";
e.fulldescription += tempdesc[2];