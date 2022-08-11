class CreatorSerializer < ActiveModel::Serializer
  attributes :id
  attributes :first_name
  attributes :last_name
  has_many :gigs
end
