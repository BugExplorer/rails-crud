FactoryGirl.define do
  factory :tag do
    name "Name"
    slug "Slug"

    factory :invalid_tag do
      slug nil
    end
  end
end
