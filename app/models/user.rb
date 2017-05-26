class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    self.email.split("@").first
  end

  has_many :memberships
  has_many :groups, :through => :memberships
  has_one :profile
  # 在更新 User 时，也顺便可以更新 Profile 资料
  accepts_nested_attributes_for :profile
end
