class Person
  attr_reader :name,
              :id

  def initialize(attributes_hash)
    @name = attributes_hash[:name]
    @id = attributes_hash[:id]
  end
end
