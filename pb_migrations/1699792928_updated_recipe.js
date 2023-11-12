/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("gj7f333xdm2owis")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "whqinrja",
    "name": "image",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "maxSize": 5242880,
      "mimeTypes": [],
      "thumbs": [],
      "protected": false
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("gj7f333xdm2owis")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "whqinrja",
    "name": "image",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "maxSize": 5242880,
      "mimeTypes": [],
      "thumbs": [
        "50x50"
      ],
      "protected": false
    }
  }))

  return dao.saveCollection(collection)
})
