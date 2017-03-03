require "administrate/base_dashboard"

class ForumDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    comments: Field::HasMany,
    votes_for: Field::HasMany.with_options(class_name: "ActsAsVotable::Vote"),
    taggings: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tagging"),
    base_tags: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tag"),
    label_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    labels: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    tag_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    tags: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    keyword_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    keyword: Field::String,
    id: Field::Number,
    title: Field::String,
    content: Field::Text,
    major: Field::String,
    keyword: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :comments,
    :votes_for,
    :taggings,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :comments,
    :votes_for,
    :taggings,
    :base_tags,
    :label_taggings,
    :labels,
    :tag_taggings,
    :tags,
    :keyword_taggings,
    :keyword,
    :id,
    :title,
    :content,
    :major,
    :keyword,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :comments,
    :votes_for,
    :taggings,
    :base_tags,
    :label_taggings,
    :labels,
    :tag_taggings,
    :tags,
    :keyword_taggings,
    :keyword,
    :title,
    :content,
    :major,
    :keyword,
  ].freeze

  # Overwrite this method to customize how forums are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(forum)
  #   "Forum ##{forum.id}"
  # end
end
