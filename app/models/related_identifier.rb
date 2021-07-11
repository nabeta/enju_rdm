class RelatedIdentifier
  include AttrJson::Model
  attr_json :identifier, :string
  attr_json :related_identifier_type, :string
  attr_json :relation_type, :string
end
