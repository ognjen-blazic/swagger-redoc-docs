# frozen_string_literal: true

class Article < ApplicationRecord
  include Swagger::Blocks

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  swagger_schema :Article do
    key :required, %i[id title]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :title do
      key :type, :string
    end
    property :text do
      key :type, :string
    end
  end
end
