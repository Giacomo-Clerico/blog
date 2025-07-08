require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft" do
    assert draft_blog_post.draft?
  end

  test "draft? returns false for published" do
    refute published_blog_post.draft?
  end

  test "draft? returns false for scheduled" do
    refute scheduled_blog_post.draft?
  end

  test "published? returns false for draft" do
    refute draft_blog_post.published?
  end

  test "published? returns true for published" do
    assert published_blog_post.published?
  end

  test "published? returns false for scheduled" do
    refute scheduled_blog_post.published?
  end

  test "scheduled? returns false for draft" do
    refute draft_blog_post.scheduled?
  end

  test "scheduled? returns false for published" do
    refute published_blog_post.scheduled?
  end

  test "scheduled? returns true for scheduled" do
    assert scheduled_blog_post.scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
  def published_blog_post
    BlogPost.new(published_at: 1.year.ago)
  end
  def scheduled_blog_post
    BlogPost.new(published_at: 1.year.from_now)
  end
end
