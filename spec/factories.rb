FactoryGirl.define do
  factory :user do
    username 'Davida'
    token '123456'
    secret '123456'
  end

  factory :twitter_feed, class: TwitterFeed do
    identifier "2305620871"
    type "TwitterFeed"
    id 1
  end

  factory :post, class: Post do
    feed_id 1
    content "This post is a great success!"
    published "2014-1-26"
  end

  factory :feed_user, class: FeedUser do
    user_id 1
    feed_id 1
  end

  factory :post1, class: Post do
    feed_id 1
    published '2014-01-23'
  end

  factory :post2, class: Post do
    feed_id 1
    published '2014-01-24'
  end

  factory :tumblr_feed, class: Tumblr do 
    identifier "llenees"
    type "TumblrFeed"
    id 1
  end
end