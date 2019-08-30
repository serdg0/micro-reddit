# frozen_string_literal: true

require 'test_helper'
class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Mephisto', email: 'boss@email.com',
                     password: '1234', password_confirmation: '1234')
  end
  test 'user should be valid' do
    assert @user.valid?
  end
  test "name can't be blank" do
    @user.name = ' '
    assert_not @user.valid?
  end
  test "name can't be too short" do
    @user.name = 'a' * 3
    assert_not @user.valid?
  end
  test "name can't be too long" do
    @user.name = 'a' * 17
    assert_not @user.valid?
  end
  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end
  test "email shouldn't be too long" do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end
  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end
