FactoryGirl.define do
  factory :unstarted_journey, class: Journey do
    taxi { create(:taxi) }
    start_latitude 0.0
    start_longitude 0.0
    status 0
  end

  factory :started_journey, class: Journey do
    taxi { create(:taxi) }
    start_latitude 0.0
    start_longitude 0.0
    start_time { DateTime.current }
    status 1
  end

  factory :ended_journey, class: Journey do
    taxi { create(:taxi) }
    start_latitude 0.0
    start_longitude 0.0
    end_latitude 10.0
    end_longitude 0.0
    start_time { DateTime.current }
    end_time { DateTime.current }
    status 2
  end
end