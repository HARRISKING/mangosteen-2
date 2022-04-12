class Record < ApplicationRecord
 validates_presence_of :amount, :category
 enum category: {outgoing: 1, income: 2}
end
