# frozen_string_literal: true

module DogsHelper
  def format_gender(dog)
    dog.gender = if dog.gender === '1'
                   'Male'
                 else
                   'Female'
                 end
  end
end
