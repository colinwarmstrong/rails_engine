FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number ""
    credit_card_expiration_date "MyText"
    result "MyText"
    created_at "2018-08-13 20:49:53"
    updated_at "2018-08-13 20:49:53"
  end
end
