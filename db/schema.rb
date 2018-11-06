# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_181_010_190_146) do
  create_table 'active_admin_comments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'active_storage_attachments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'admin_users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'competitions', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'slug'
    t.boolean 'current'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'friendly_id_slugs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true, length: { slug: 70, scope: 70 }
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type', length: { slug: 140 }
    t.index ['sluggable_id'], name: 'index_friendly_id_slugs_on_sluggable_id'
    t.index ['sluggable_type'], name: 'index_friendly_id_slugs_on_sluggable_type'
  end

  create_table 'matches', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'competition_id'
    t.bigint 'first_team_id'
    t.integer 'first_team_score'
    t.bigint 'second_team_id'
    t.integer 'second_team_score'
    t.bigint 'winner_id'
    t.datetime 'started_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'match_type', default: 0
    t.index ['competition_id'], name: 'index_matches_on_competition_id'
    t.index ['first_team_id'], name: 'index_matches_on_first_team_id'
    t.index ['second_team_id'], name: 'index_matches_on_second_team_id'
    t.index ['winner_id'], name: 'index_matches_on_winner_id'
  end

  create_table 'predictions', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'match_id'
    t.integer 'first_team_score', default: 0, null: false
    t.integer 'second_team_score', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['match_id'], name: 'index_predictions_on_match_id'
    t.index ['user_id'], name: 'index_predictions_on_user_id'
  end

  create_table 'teams', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'acronym'
    t.string 'slug'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'username'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.integer 'score', default: 0
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'matches', 'competitions'
  add_foreign_key 'matches', 'teams', column: 'first_team_id'
  add_foreign_key 'matches', 'teams', column: 'second_team_id'
  add_foreign_key 'matches', 'teams', column: 'winner_id'
  add_foreign_key 'predictions', 'matches'
  add_foreign_key 'predictions', 'users'
end
