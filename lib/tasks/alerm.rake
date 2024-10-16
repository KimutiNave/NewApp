namespace :alerm do
  desc "Create_alerm(30minute)"
  task create_alerm_timely: :environment do
    if AnotherPost.where(notice_days: "minute").exists?
      create_task_alerm
    end
  end

  desc "Create_alerm(1day)"
  task create_alerm_daily: :environment do
    if AnotherPost.where(notice_days: "day").exists?
      create_task_alerm
    end
  end

  desc "Create_alerm(1week)"
  task create_alerm_weekly: :environment do
    if AnotherPost.where(notice_days: "week").exists?
      create_task_alerm
    end
  end

  desc "Create_alerm(1month)"
  task create_alerm_monthly: :environment do
    if AnotherPost.where(notice_days: "month").exists?
      create_task_alerm
    end
  end

  def create_task_alerm
    alerm_day = AnotherPost.where(notice_days: ["minute", "day", "week", "month"])
    if alerm_day.exists?
      temp = AnotherPost.where(confirmn: false)
      if temp.present?
        another_posts = AnotherPost.all
        another_posts.each do |another_post|
          user = another_post.user
          alerm = Alerm.create(
            user_id: user.id,
            another_post_id: another_post.id
          )
        end
        temp.update(confirmn: true)
      end
    end
  end
end
