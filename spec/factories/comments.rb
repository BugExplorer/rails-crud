FactoryGirl.define do
  factory :comment do
    author_name "User"
    content "Content"
    commentable_type "Post"

    factory :invalid_comment do
      content nil
    end
  end
end
