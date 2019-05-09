/// @description  void debug_write();

buffer_save_ext(debug_log, LOG_FILE, 0, buffer_tell(debug_log));
debug_modified=false;
debug_last_write=get_timer();
