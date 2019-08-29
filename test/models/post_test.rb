# frozen_string_literal: true

require 'test_helper'
class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = Post.new(title: 'El post que te gusta', body: 'Se que te gusta Codear !!')
  end
  test 'title should be unique' do
    duplicated_post = @post.dup
    duplicated_post.title = @post.title
    @post.save
    assert_not duplicated_post.valid?
  end
  test 'title should not be blank' do
    @post.title = ' '
    assert_not @post.valid?
  end
  test 'Body should not be blank' do
    @post.body = ' '
    assert_not @post.valid?
  end
end
