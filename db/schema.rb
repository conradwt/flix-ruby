# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_210_511_064_728) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'characterizations', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'genre_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['genre_id'], name: 'index_characterizations_on_genre_id'
    t.index ['movie_id'], name: 'index_characterizations_on_movie_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['movie_id'], name: 'index_favorites_on_movie_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title'
    t.string 'rating'
    t.decimal 'total_gross'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'description'
    t.date 'released_on'
    t.string 'director'
    t.string 'duration'
    t.string 'slug'
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'stars'
    t.text 'comment'
    t.integer 'movie_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index ['movie_id'], name: 'index_reviews_on_movie_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'admin', default: false
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'characterizations', 'genres'
  add_foreign_key 'characterizations', 'movies'
  add_foreign_key 'favorites', 'movies'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'reviews', 'movies'
end
