class User < ActiveRecord::Base
  # TODO: validation that when role == 'Dept head', department should not be null
  authenticates_with_sorcery!
  belongs_to :department

  validates :password, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :department, presence: true, if: -> { role == "Department Head" }

  # validate :department_cannot_be_null
  #
  # def department_cannot_be_null
  #   if role == "Department Admin" && department == nil
  #     errors.add(department, "cannot be null")
  #   end
  # end
end
