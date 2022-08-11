class CreateGigPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :gig_payments do |t|
      t.integer :state, :default => GigPayment.states["pending"]
      t.belongs_to :gig, null: false, foreign_key: true

      t.timestamps
    end
  end
end
