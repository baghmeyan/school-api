class Role < ApplicationRecord
    has_one :user
    acts_as_api

    api_accessible :public do |role|
        role.add :name
        role.add :display_name
    end
end
