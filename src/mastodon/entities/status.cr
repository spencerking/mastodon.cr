require "json"
require "./attachment"
require "./mention"
require "./account"
require "./tag"
require "./status"

module Mastodon
  module Entities
    class Status
      include JSON::Serializable

      @[JSON::Field(key: "id")]
      property id : String

      @[JSON::Field(key: "uri")]
      property uri : String

      @[JSON::Field(key: "url")]
      property url : String

      @[JSON::Field(key: "account")]
      property account : Entities::Account

      @[JSON::Field(key: "in_reply_to_id")]
      property in_reply_to_id : Int64?

      @[JSON::Field(key: "in_reply_to_account_id")]
      property in_reply_to_account_id : Int64?

      @[JSON::Field(key: "reblog")]
      property reblog : Entities::Status?

      @[JSON::Field(key: "content")]
      property content : String

      @[JSON::Field(key: "created_at", converter: Time::Format.new("%Y-%m-%dT%T"))]
      property created_at : Time

      @[JSON::Field(key: "reblogs_count")]
      property reblogs_count : Int32

      @[JSON::Field(key: "favourites_count")]
      property favourites_count : Int32

      @[JSON::Field(key: "reblogged")]
      property reblogged : Bool?

      @[JSON::Field(key: "favourited")]
      property favourited : Bool?

      @[JSON::Field(key: "sensitive")]
      property sensitive : Bool?

      @[JSON::Field(key: "spoiler_text")]
      property spoiler_text : String

      @[JSON::Field(key: "visibility")]
      property visibility : String # public, unlisted, private, direct

      @[JSON::Field(key: "media_attachments")]
      property media_attachments : Array(Entities::Attachment)

      @[JSON::Field(key: "mentions")]
      property mentions : Array(Entities::Mention)

      @[JSON::Field(key: "tags")]
      property tags : Array(Entities::Tag)

      @[JSON::Field(key: "application")]
      property application : Entities::Application?

      @[JSON::Field(key: "language")]
      property language : String? # from v1.4rc3

      def_equals id
    end
  end
end
