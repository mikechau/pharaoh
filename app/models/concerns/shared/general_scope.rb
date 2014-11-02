module Shared::GeneralScope
  extend ActiveSupport::Concern

  included do
    scope :order_by_id, -> { order(id: :asc) }
  end

end

# -*- SkipSchemaAnnotations
