class User < ActiveRecord::Base
  include Shared::GeneralScope

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable,
    :validatable, :confirmable, :lockable

  before_save :assign_default_role
  after_initialize :downcase_email

  validates_presence_of :name

  def first_name
    first_name = name.match(/\S*/)
    first_name.nil? ? 'Unknown' : first_name.to_s
  end

  def last_name
    last_name = name.match(/[^ ]* (.*)/)
    last_name.nil? ? 'Unknown' : last_name[1].to_s
  end

  def all_roles
    roles.map { |r| r.name }
  end

  def sym_roles
    roles.map { |r| r.name.to_sym }
  end

  def is_admin?
    self.has_role? :admin
  end

  private
    def assign_default_role
      self.add_role :user if self.roles.first.nil?
    end

    def downcase_email
      self.email.downcase! unless self.email.blank?
    end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
