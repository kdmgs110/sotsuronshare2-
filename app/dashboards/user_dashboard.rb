require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    posts: Field::HasMany,
    forums: Field::HasMany,
    votes_for: Field::HasMany.with_options(class_name: "ActsAsVotable::Vote"),
    taggings: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tagging"),
    base_tags: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tag"),
    label_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    labels: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    tag_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    tags: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    interest_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    interests: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    votes: Field::HasMany.with_options(class_name: "ActsAsVotable::Vote"),
    followings: Field::HasMany.with_options(class_name: "Follow"),
    follows: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    avatar_url: Field::String,
    fb_id: Field::String,
    oauth_token: Field::String,
    oauth_provider: Field::String,
    oauth_expires_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    bio: Field::String,
    abstract: Field::Text,
    thesisName: Field::String,
    attachment: Field::String,
    major: Field::String,
    nick: Field::String,
    nickname: Field::String,
    username: Field::String,
    graduate: Field::String,
    email: Field::String,
    years: Field::String,
    twitter_id: Field::String,
    people: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :comments,
    :posts,
    :forums,
    :votes_for,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :comments,
    :posts,
    :forums,
    :votes_for,
    :taggings,
    :base_tags,
    :label_taggings,
    :labels,
    :tag_taggings,
    :tags,
    :interest_taggings,
    :interests,
    :votes,
    :followings,
    :follows,
    :id,
    :name,
    :avatar_url,
    :fb_id,
    :oauth_token,
    :oauth_provider,
    :oauth_expires_at,
    :created_at,
    :updated_at,
    :bio,
    :abstract,
    :thesisName,
    :attachment,
    :major,
    :nick,
    :nickname,
    :username,
    :graduate,
    :email,
    :years,
    :twitter_id,
    :people,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :comments,
    :posts,
    :forums,
    :votes_for,
    :taggings,
    :base_tags,
    :label_taggings,
    :labels,
    :tag_taggings,
    :tags,
    :interest_taggings,
    :interests,
    :votes,
    :followings,
    :follows,
    :name,
    :avatar_url,
    :fb_id,
    :oauth_token,
    :oauth_provider,
    :oauth_expires_at,
    :bio,
    :abstract,
    :thesisName,
    :attachment,
    :major,
    :nick,
    :nickname,
    :username,
    :graduate,
    :email,
    :years,
    :twitter_id,
    :people,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
