/// @description  void load_data_link_event_custom();

for (var i=0; i<array_length_1d(World.all_event_custom); i++){
    var custom=World.all_event_custom[i];
    for (var j=0; j<array_length_1d(custom.types); j++){
        var type=custom.types[j];
        if (type[1]==DataTypes.DATA||type[1]==DataTypes.ENUM){
            type[2]=guid_get(type[2]);
        }
        custom.types[j]=type;
    }
}
