module Bullhorn
  module Rest
  module Entities

  module File
    extend Base

    FILE_OPTIONS = { fields: 'id,type,contentType,name,fileType' }

    def file(entity_id, file_id, options=FILE_OPTIONS)
      params = {fields: options[:fields] }.merge(options)
      path = "file/Candidate/#{entity_id}/#{file_id}"

      res = conn.get path, params
      Hashie::Mash.new JSON.parse(res.body)
    end

    def file_raw(entity_id, file_id, options=FILE_OPTIONS)
      params = {fields: options[:fields] }.merge(options)
      path = "file/Candidate/#{entity_id}/#{file_id}/raw"

      res = conn.get path, params
      res.body
    end
  end

  end
  end
  end
