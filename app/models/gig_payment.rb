class GigPayment < ApplicationRecord
  include AASM

  belongs_to :gig

  enum state: {
    pending: 0,
    complete: 1,
  }

  aasm column: :state, enum: true do
    state :pending, initial: true
    state :complete, before_enter: :complete_event_listener
  end

  def complete_event_listener
    self.gig.paid!
  end
end
