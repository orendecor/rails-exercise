class GigPaymentSerializer < ActiveModel::Serializer
  attributes :id
  attributes :state
  belongs_to :gig
end
