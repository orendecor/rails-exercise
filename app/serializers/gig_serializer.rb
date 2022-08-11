class GigSerializer < ActiveModel::Serializer
  attributes :id,:state ,:brand_name
  belongs_to :creator
  has_many :gig_payments

end
