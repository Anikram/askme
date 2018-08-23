FactoryBot.define do
  factory :question do
    text { 'one #two @three #four! #five' }
    answer { 'yes #no #maybe? #shure' }
    user { create :user }
  end
end