require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    votes_for: Field::HasMany.with_options(class_name: "ActsAsVotable::Vote"),
    user: Field::BelongsTo,
    comments: Field::HasMany,
    taggings: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tagging"),
    base_tags: Field::HasMany.with_options(class_name: "::ActsAsTaggableOn::Tag"),
    label_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    labels: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    tag_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    tags: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    keyword_taggings: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tagging"),
    keywords: Field::HasMany.with_options(class_name: "ActsAsTaggableOn::Tag"),
    id: Field::Number,
    file: Field::String,
    title: Field::String,
    summary: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    major: Field::String,
    year: Field::Number,
    teacher: Field::String,
    keyword: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :votes_for,
    :user,
    :comments,
    :taggings,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :votes_for,
    :user,
    :comments,
    :taggings,
    :base_tags,
    :label_taggings,
    :labels,
    :tag_taggings,
    :tags,
    :keyword_taggings,
    :keywords,
    :id,
    :file,
    :title,
    :summary,
    :created_at,
    :updated_at,
    :major,
    :year,
    :teacher,
    :keyword,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :votes_for,
    :user,
    :comments,
    :taggings,
    :base_tags,
    :label_taggings,
    :labels,
    :tag_taggings,
    :tags,
    :keyword_taggings,
    :keywords,
    :file,
    :title,
    :summary,
    :major,
    :year,
    :teacher,
    :keyword,
  ].freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
