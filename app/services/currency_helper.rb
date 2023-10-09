class CurrencyHelper
  class << self
    def add_formatted_currency(x)
      x["formatted_amount"] = Money.from_amount(x["amount"], x["currency"]).format
      x
    end
  end
end