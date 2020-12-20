class Participant
  include Mongoid::Document
  include Mongoid::Timestamps

  ROLES = {
    responsible: 1,
    follower: 2
  }.freeze

  field :role, type: Integer

  belongs_to :user
  belongs_to :task

  def self.roles
    ROLES
  end
end
