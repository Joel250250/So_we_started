

ini_open("data.ini");
	if (ini_read_string("Data","message1","") = "true") {
		room_goto(room_starting);
	}else {
		save_string("data.ini","Data","message1","false");
	}
ini_close();

_Page = 0;
text_f = 0;
f = 0;
r_h = 0;
r_f = 0;
_Text[0] = "#Document1#";
_Text[1] = "Hello?";
_Text[2] = "Are you there?";
_Text[3] = "B...";
_Text[4] = "Well, forget the last sentence I said.";
_Text[5] = "Well, forget the last sentence I said.";
_Text[6] = "Hi!";
_Text[7] = "This is a message from someone";
_Text[8] = "to tell you";
_Text[9] = "a whole new story has begun.";
_Text[10] = "Oh!";
_Text[11] = "The Sun is rising from the horizon.";
_Text[12] = "Open your eyes!"