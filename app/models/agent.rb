class Agent
  include AttrJson::Model
  include AttrJson::Model::CocoonCompat

  attr_json :full_name, :string
end
