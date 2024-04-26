module Bullhorn
module Rest
module Entities

module Note
  extend Base

  define_methods(:owner_methods => true)

  def link_note_to_candidate(note_id, candidate_id)
    path = "entity/Note/#{note_id}/candidates/#{candidate_id}"
    res = @conn.put path

    Hashie::Mash.new JSON.parse(res.body)
  end
end

end
end
end
