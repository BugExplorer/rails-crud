FactoryGirl.define do
  factory :article do
    title "Title"
    description "Description"
    content "Content"
    author_name "User"

    factory :invalid_article do
      content nil
    end
  end
end
