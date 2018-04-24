class Produto < ApplicationRecord
  belongs_to :departamento #O produto pertence a um departamento
  validates :quantidade, presence: true
  validates :nome, length: {minimum: 5}
end
