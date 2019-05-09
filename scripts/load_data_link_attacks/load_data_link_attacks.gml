/// @description  void load_data_link_attacks();

for (var i=0; i<array_length_1d(Database.all_attacks); i++){
    Database.all_attacks[i].type=guid_get(Database.all_attacks[i].type);
}
