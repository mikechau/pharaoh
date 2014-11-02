require "rails_helper"

describe UserPolicy do
  subject { UserPolicy }

  it_behaves_like "admin only permission policy",
    [
      :index?,
      :show?,
      :create?,
      :new?,
      :update?,
      :edit?,
      :destroy?
    ]
end