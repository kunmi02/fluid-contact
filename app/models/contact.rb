class Contact < ApplicationRecord
  validates_presence_of :email # , :address
end
