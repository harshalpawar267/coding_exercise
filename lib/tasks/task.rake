namespace :task do
  desc "TODO"
  task send_mail: :environment do
    TaskReport.task_daily_report.deliver_now
  end

  task send_one_day_mail: :environment do
    TaskReport.send_one_day_deadline_email.deliver_now
  end

end
