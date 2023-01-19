class PersonApp
  def initialize
    @persons = []
  end

  def add_person(person)
    @persons << person
  end

  def update_person(person)
    @persons = @persons.map { |ps|
      if person[:name] == ps[:name]
        person
      else
        ps
      end
    }
  end

  def delete_person(person)
    # @persons = @persons.select { |per|
    #   person[:name] != per[:name]
    # }

    @persons = @persons.filter { |per|
      person[:name] != per[:name]
    }
  end

  def get_all_persons
    @persons
  end
  def get_one_person (person_name)
    @persons.each do |person|
      if person[:name] ==  person_name
        return person
      end
    end
  end
end

person_app = PersonApp.new
person_app.add_person({ name:  'Sajon', age: 23})
person_app.add_person({ name:  'Masum', age: 13})
person_app.add_person({ name:  'Rafid', age: 14})
person_app.add_person({ name:  'Mahmud', age: 53})
person_app.add_person({ name:  'Habib', age: 3})

person_app.update_person({ name: 'Mahmud', age: 53})
person_app.delete_person({ name: 'Mahmud', age: 53})
p person_app.get_one_person('Habib')

p person_app.get_all_persons