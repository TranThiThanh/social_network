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

ActiveRecord::Schema.define(version: 20170814044345) do


  create_table "activity_logs", force: :cascade do |t|
    t.integer "user_id"
    t.string "activity_type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_activity_logs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "chatroom_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id", "created_at"], name: "index_chatroom_users_on_chatroom_id_and_created_at"
    t.index ["chatroom_id"], name: "index_chatroom_users_on_chatroom_id"
    t.index ["user_id", "created_at"], name: "index_chatroom_users_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_chatroom_users_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "created_at"], name: "index_comments_on_post_id_and_created_at"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "Member"
    t.index ["group_id", "created_at"], name: "index_group_users_on_group_id_and_created_at"
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id", "created_at"], name: "index_group_users_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name_group"
    t.string "description"
    t.string "recent_news"
    t.string "privacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "cover"
    t.index ["owner_id", "created_at"], name: "index_groups_on_owner_id_and_created_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer "post_id"
    t.string "name_image"
    t.string "image_detail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "created_at"], name: "index_images_on_post_id_and_created_at"
    t.index ["post_id"], name: "index_images_on_post_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "group_id"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "created_at"], name: "index_invites_on_group_id_and_created_at"
    t.index ["group_id"], name: "index_invites_on_group_id"
    t.index ["sender_id", "recipient_id"], name: "index_invites_on_sender_id_and_recipient_id", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id", "created_at"], name: "index_likes_on_comment_id_and_created_at"
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["post_id", "created_at"], name: "index_likes_on_post_id_and_created_at"
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "created_at"], name: "index_likes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "created_at"], name: "index_locations_on_post_id_and_created_at"
    t.index ["post_id"], name: "index_locations_on_post_id"
    t.index ["user_id", "created_at"], name: "index_locations_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "recipient_id"
    t.integer "conversation_id"
    t.string "description"
    t.string "notification_detail_url"
    t.boolean "isRead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id", "recipient_id"], name: "index_notifications_on_actor_id_and_recipient_id", unique: true
    t.index ["actor_id"], name: "index_notifications_on_actor_id"
    t.index ["conversation_id"], name: "index_notifications_on_conversation_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_posts_on_group_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index [nil, "created_at"], name: "index_posts_on_follwed_id_and_created_at"
    t.index [nil, "created_at"], name: "index_posts_on_follwer_id_and_created_at"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "birthday"
    t.string "gender"
    t.string "job"
    t.string "phone"
    t.string "address"
    t.string "avatar"
    t.string "cover"
    t.boolean "activated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "activation_digest"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.integer "post_id"
    t.string "name_video"
    t.string "video_detail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "created_at"], name: "index_videos_on_post_id_and_created_at"
    t.index ["post_id"], name: "index_videos_on_post_id"
  end

end
