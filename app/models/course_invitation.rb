class CourseInvitation < ActiveRecord::Base

  include InvitationConcerns

  belongs_to :course

  validates :course, :member, presence: true
  validates :member_id, uniqueness: { scope: [:course ] }

  def parent
    course
  end

  private

  def email
    CourseInvitationMailer.invite_student(self.course, self.member, self).deliver
  end
end
