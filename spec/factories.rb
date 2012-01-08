FactoryGirl.define do
  factory :user do
    username 'tomer'
    password 'password'
    email    'email@example.com'
  end

  factory :event do
    name          'Awesome event'
    latitude      '33.000000'
    longitude     '-84.000000'
    message       'Message for an event'
    datetime      DateTime.now(2000,1,1,1,0,0)
    timezone      'EST'
    min_latitude  '32.999'
    max_latitude  '33.001'
    min_longitude '-84.001'
    max_longitude '-83.999'
  end
end
