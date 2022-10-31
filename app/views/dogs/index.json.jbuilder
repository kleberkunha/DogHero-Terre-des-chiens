# frozen_string_literal: true

json.array! @dogs, partial: 'dogs/dog', as: :dog
