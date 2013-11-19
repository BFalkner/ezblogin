define (require) ->
  DS = require 'ember-data'
  
  DS.RESTAdapter.extend
    serializer: DS.RESTSerializer.extend
      primaryKey: (type) ->
        '_id'

      serializeId: (id) ->
        id.toString()
