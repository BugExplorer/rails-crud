FactoryGirl.define do
  factory :article do
    title "Title"
    content "Content"
    author_name "User"

    factory :invalid_article do
      content nil
    end
  end
end
