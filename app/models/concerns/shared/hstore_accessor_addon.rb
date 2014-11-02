module Shared::HstoreAccessorAddon
  def hstore_keys
    self.hstore_metadata_for_formula.keys
  end
end

# -*- SkipSchemaAnnotations
