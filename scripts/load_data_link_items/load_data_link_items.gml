/// @description  void load_data_link_items();

for (var i=0; i<array_length_1d(Database.all_items); i++){
    Database.all_items[i].pocket=guid_get(Database.all_items[i].pocket);
    Database.all_items[i].equip_slot=guid_get(Database.all_items[i].equip_slot);
}
