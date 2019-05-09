{
    "id": "1e4e4741-5aa1-4a9b-b3f1-56ef1e272284",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "buffer_zlib",
    "IncludedResources": [
        "Fonts\\fnt_zlib_test",
        "Objects\\obj_zlib_test",
        "Rooms\\rm_zlib_test",
        "Included Files\\buffer_zlib_manual.html"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 1048640,
    "date": "2019-49-06 11:05:42",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "ad8b4d29-0c7e-4f62-a804-14a9cd1b9650",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "ded7c401-0d58-480f-9525-fede54376a8b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status_ok",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "563890b7-af7b-4737-acf2-01a75f7de86e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status_stream_error",
                    "hidden": false,
                    "value": "-2"
                },
                {
                    "id": "0c1fbfcd-52ed-4d8d-8ff4-00f3da525b7c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status_data_error",
                    "hidden": false,
                    "value": "-3"
                },
                {
                    "id": "ac58215c-4cbb-4b9e-8009-96700be8af7b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status_memory_error",
                    "hidden": false,
                    "value": "-4"
                },
                {
                    "id": "903cc831-d186-4961-bed5-6264c27c77c0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status_buffer_error",
                    "hidden": false,
                    "value": "-5"
                }
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "buffer_zlib.dll",
            "final": "",
            "functions": [
                {
                    "id": "2cd9d257-b370-4b14-a6ef-1b38981fee0d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        2,
                        2,
                        2
                    ],
                    "externalName": "buffer_deflate_raw1",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_deflate_raw1",
                    "returnType": 2
                },
                {
                    "id": "f695c3ee-007d-44da-bfb1-0fd154cd82b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "buffer_deflate_raw2",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_deflate_raw2",
                    "returnType": 2
                },
                {
                    "id": "ac9d6277-eeb1-4daa-96ba-fc6b234fbeb0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "buffer_inflate_raw1",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_inflate_raw1",
                    "returnType": 2
                },
                {
                    "id": "8a8f7a27-342c-4847-bfd6-24960c299498",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "buffer_inflate_raw2",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_inflate_raw2",
                    "returnType": 2
                },
                {
                    "id": "d2809124-8749-4bb5-a355-4fb1e7b5663d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "buffer_zlib_init_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_zlib_init_raw",
                    "returnType": 2
                },
                {
                    "id": "2cd2ad32-4482-4272-ba90-965babe69d32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "buffer_zlib_get_status",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_zlib_get_status",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\buffer_zlib.dll",
            "uncompress": false
        },
        {
            "id": "c50ea690-34b9-4068-97e2-2bd560b0e3b7",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "132c55b6-2a17-4b1f-bc02-77370db4a1ec",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_chunk_size",
                    "hidden": false,
                    "value": "global.g_buffer_zlib_chunk_size"
                },
                {
                    "id": "148f8455-607f-424a-a78d-406e2ba6bea6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_available",
                    "hidden": false,
                    "value": "global.g_buffer_zlib_available"
                },
                {
                    "id": "31b3ea15-689c-4099-a599-15acf24e821c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "macro",
                    "hidden": false,
                    "value": "buffer_zlib_status buffer_zlib_get_status()"
                },
                {
                    "id": "fb1a3830-09a0-43e0-bbbc-a112439133ad",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status",
                    "hidden": false,
                    "value": "buffer_zlib_get_status()"
                },
                {
                    "id": "156f3002-7c60-41af-ae96-e44b10a299da",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_status \/* Raw zlib status ID (in case of errors) *\/",
                    "hidden": false,
                    "value": "buffer_zlib_get_status()"
                },
                {
                    "id": "8d485642-d910-4845-898d-7daa46cbeb29",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_chunk_size \/* Number of bytes to process at once in inflate\/deflate *\/",
                    "hidden": false,
                    "value": "global.g_buffer_zlib_chunk_size"
                },
                {
                    "id": "535e7d5d-e9b6-4cad-a014-d48e273551b1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "buffer_zlib_available \/* Whether the buffer_zlib extension is successfully loaded *\/",
                    "hidden": false,
                    "value": "global.g_buffer_zlib_available"
                }
            ],
            "copyToTargets": 113497714299118,
            "filename": "buffer_zlib.gml",
            "final": "",
            "functions": [
                {
                    "id": "10df96a9-0107-461c-b76d-d81d171e8f1f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "buffer_zlib_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_zlib_init",
                    "returnType": 2
                },
                {
                    "id": "ddb08550-cdc7-4e66-a615-df1e82f19a22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "buffer_deflate",
                    "help": "buffer_deflate(buffer, offset, size, compression_level[1..9], ?out_buffer) : Compresses a part of a buffer to a new or given buffer.",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_deflate",
                    "returnType": 2
                },
                {
                    "id": "ed4e8124-3a68-4609-91c7-76b828b396c2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "buffer_inflate",
                    "help": "buffer_inflate(buffer, offset, size, ?out_buffer) : Decompresses a part of a buffer to a new or given buffer.",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_inflate",
                    "returnType": 2
                }
            ],
            "init": "buffer_zlib_init",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Proprietary",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "cc.yal.zlib",
    "productID": "",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}