module DogsHelper

    def format_gender(dog)
        if dog.gender === '1'
            dog.gender = "Male"
        else
            dog.gender = "Female"
        end
    end

end
