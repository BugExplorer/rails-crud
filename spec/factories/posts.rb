FactoryGirl.define do
  factory :post do
    title "Title"
    content "Content"
    author_name "User"
    parameters { { category: "Rails", title_size: "Small" } }

    factory :invalid_post do
      content nil
    end
  end
end
