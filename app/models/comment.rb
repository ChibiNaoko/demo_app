class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry

  validate :valid_owner_comment

  private
  def valid_owner_comment
    return if user == entry.user || entry.user.followers.include?(user)

    self.errors.add :base, "May khong dc phep comment"
  end
end
