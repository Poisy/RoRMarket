class Card < ApplicationRecord
  belongs_to :product

  has_many :transactions

  before_create :generate_activation_number

  scope :issued, -> { where(status: "issued") }
  scope :available, -> { where(status: "available") }

  private def generate_activation_number
    self.activation_number = loop do
      # Generate a random activation number
      random_activation_number = rand(100000000..999999999)

      # Check if the generated number is already in use
      break random_activation_number unless Card.exists?(activation_number: random_activation_number)
    end
  end
end
