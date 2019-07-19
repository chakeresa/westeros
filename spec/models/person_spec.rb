require 'spec_helper'
require './app/models/person'

RSpec.describe Person do
  it 'exists with attributes' do
    attr_hash = {
      name: 'Theon',
      id: 42
    }
    person = Person.new(attr_hash)
    
    expect(person).to be_a(Person)
    expect(person.name).to eq('Theon')
    expect(person.id).to eq(42)
  end
end
