var _save_file = argument0;
var _selection = argument1;
var _save_line = argument2;
var _save_content = argument3;

ini_open(_save_file);

ini_write_real(_selection,_save_line,_save_content);

ini_close();