class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :employee, optional: true
  belongs_to :chatroom
  after_create_commit{ BroadcastMessageJob.perform_later self }
  belongs_to :tutor, class_name: "Employee", foreign_key: "tutor_id", optional: true
end
