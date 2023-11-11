/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "gk5gaoeq8v00oo1",
    "created": "2023-11-11 03:35:47.068Z",
    "updated": "2023-11-11 03:35:47.068Z",
    "name": "admin",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "0sytfras",
        "name": "username",
        "type": "text",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "jexqb2ih",
        "name": "field",
        "type": "email",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "exceptDomains": [],
          "onlyDomains": []
        }
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("gk5gaoeq8v00oo1");

  return dao.deleteCollection(collection);
})
