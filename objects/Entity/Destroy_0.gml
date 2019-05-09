// this caused problems involving not firing in the editor. if
// causes problems by not firing here (i.e. a memory leak, etc)
// do the entity_destroy() thing that the editor does.

ds_list_destroy(object_events);

