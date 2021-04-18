class TaskReport < ApplicationMailer

  def task_daily_report()
    @task_details = Task.where(deadline: (Time.now + 1*60*60)).to_a
    @task_details.each_with_index do |data, i|
      mail(to: data.user.email, subject: 'Task dealine.')
    end
  end

  def send_one_day_deadline_email()
    @task_details = Task.where(deadline: (Time.now + 1.days)).to_a
    @task_details.each_with_index do |data, i|
      mail(to: data.user.email, subject: 'Task dealine.')
    end
  end
end
