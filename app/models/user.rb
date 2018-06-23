class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: {man: 0, woman: 1}

  has_many :interview, dependent: :destroy

  def age
    if self.birthday
      (Date.today.strftime("%Y%m%d").to_i - self.birthday.strftime("%Y%m%d").to_i) / 10000
    end
  end
end
