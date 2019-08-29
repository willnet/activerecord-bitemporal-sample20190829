# README

```sh
./bin/setup
./bin/rails c
```

```ruby
a = A.new
b = B.new(name: '1')
a.b = b
a.save
a2 = a.dup
a2.b.update(name: '2')
a.b.valid? #=> false
```

```
irb(main):001:0> a = A.new
=> #<A id: nil, b_id: nil, created_at: nil, updated_at: nil>
irb(main):002:0> b = B.new(name: 'b1')
=> #<B id: nil, name: "b1", bitemporal_id: nil, valid_from: "1900-12-31 00:00:00", valid_to: "9999-12-31 00:00:00", deleted_at: nil, created_at: nil, updated_at: nil>
irb(main):003:0> a.b = b
=> #<B id: nil, name: "b1", bitemporal_id: nil, valid_from: "1900-12-31 00:00:00", valid_to: "9999-12-31 00:00:00", deleted_at: nil, created_at: nil, updated_at: nil>
irb(main):004:0> a.save
   (0.1ms)  begin transaction
   (0.1ms)  SAVEPOINT active_record_1
   (0.2ms)  SELECT "bs"."id" FROM "bs" WHERE "bs"."valid_from" <= '2019-08-29 05:18:52.784921' AND "bs"."valid_to" > '2019-08-29 05:18:52.784921' AND "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" IS NULL
  B Create (0.4ms)  INSERT INTO "bs" ("name", "valid_from", "valid_to", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "b1"], ["valid_from", "2019-08-29 05:18:52.787151"], ["valid_to", "9999-12-31 00:00:00"], ["created_at", "2019-08-29 05:18:52.787240"], ["updated_at", "2019-08-29 05:18:52.787240"]]
  B Update (0.1ms)  UPDATE "bs" SET "bitemporal_id" = ? WHERE "bs"."id" = ?  [["bitemporal_id", 1], ["id", 1]]
   (0.0ms)  RELEASE SAVEPOINT active_record_1
  A Create (0.1ms)  INSERT INTO "as" ("b_id", "created_at", "updated_at") VALUES (?, ?, ?)  [["b_id", 1], ["created_at", "2019-08-29 05:18:52.789732"], ["updated_at", "2019-08-29 05:18:52.789732"]]
   (6.5ms)  commit transaction
=> true
irb(main):005:0> a2 = a.dup
=> #<A id: nil, b_id: 1, created_at: nil, updated_at: nil>
irb(main):006:0> a2.b.update(name: 'b2')
  B Load (0.2ms)  SELECT  "bs".* FROM "bs" WHERE "bs"."valid_from" <= '2019-08-29 05:19:07.132997' AND "bs"."valid_to" > '2019-08-29 05:19:07.132997' AND "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" = ? LIMIT ?  [["bitemporal_id", 1], ["LIMIT", 1]]
   (0.0ms)  begin transaction
   (0.0ms)  SAVEPOINT active_record_1
   (0.1ms)  SELECT "bs"."id" FROM "bs" WHERE "bs"."valid_from" <= '2019-08-29 05:19:07.135723' AND "bs"."valid_to" > '2019-08-29 05:19:07.135723' AND "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" = ?   [["bitemporal_id", 1]]
  B Exists (0.1ms)  SELECT  1 AS one FROM "bs" WHERE "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" = ? AND "bs"."id" != ? AND (valid_from < '9999-12-31 00:00:00') AND ('2019-08-29 05:19:07.136545' < valid_to) AND "bs"."id" != ? LIMIT ?  [["bitemporal_id", 1], ["id", 1], ["id", 1], ["LIMIT", 1]]
   (0.0ms)  SAVEPOINT active_record_2
  B Load (0.1ms)  SELECT  "bs".* FROM "bs" WHERE "bs"."valid_from" <= '2019-08-29 05:19:07.138361' AND "bs"."valid_to" > '2019-08-29 05:19:07.138361' AND "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" = ? LIMIT ?  [["bitemporal_id", 1], ["LIMIT", 1]]
  B Update (0.3ms)  UPDATE "bs" SET "deleted_at" = ? WHERE "bs"."id" = ?  [["deleted_at", "2019-08-29 05:19:07.140102"], ["id", 1]]
   (0.0ms)  SAVEPOINT active_record_3
   (0.1ms)  SELECT "bs"."id" FROM "bs" WHERE "bs"."valid_from" <= '2019-08-29 05:19:07.141125' AND "bs"."valid_to" > '2019-08-29 05:19:07.141125' AND "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" IS NULL
  B Create (0.2ms)  INSERT INTO "bs" ("name", "bitemporal_id", "valid_from", "valid_to", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["name", "b1"], ["bitemporal_id", 1], ["valid_from", "2019-08-29 05:18:52.787151"], ["valid_to", "2019-08-29 05:19:07.138361"], ["created_at", "2019-08-29 05:19:07.141687"], ["updated_at", "2019-08-29 05:19:07.141687"]]
   (0.0ms)  RELEASE SAVEPOINT active_record_3
   (0.0ms)  SAVEPOINT active_record_3
   (0.1ms)  SELECT "bs"."id" FROM "bs" WHERE "bs"."valid_from" <= '2019-08-29 05:19:07.142889' AND "bs"."valid_to" > '2019-08-29 05:19:07.142889' AND "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" IS NULL
  B Create (0.1ms)  INSERT INTO "bs" ("name", "bitemporal_id", "valid_from", "valid_to", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["name", "b2"], ["bitemporal_id", 1], ["valid_from", "2019-08-29 05:19:07.138361"], ["valid_to", "9999-12-31 00:00:00"], ["created_at", "2019-08-29 05:19:07.143295"], ["updated_at", "2019-08-29 05:19:07.143295"]]
   (0.0ms)  RELEASE SAVEPOINT active_record_3
   (0.1ms)  RELEASE SAVEPOINT active_record_2
   (0.0ms)  RELEASE SAVEPOINT active_record_1
   (0.9ms)  commit transaction
=> true
irb(main):007:0> a.b.valid?
  B Exists (0.2ms)  SELECT  1 AS one FROM "bs" WHERE "bs"."deleted_at" IS NULL AND "bs"."bitemporal_id" = ? AND "bs"."id" != ? AND (valid_from < '9999-12-31 00:00:00') AND ('2019-08-29 05:19:12.668639' < valid_to) AND "bs"."id" != ? LIMIT ?  [["bitemporal_id", 1], ["id", 1], ["id", 1], ["LIMIT", 1]]
=> false
```
