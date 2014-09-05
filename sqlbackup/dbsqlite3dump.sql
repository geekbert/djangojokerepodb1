PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2014-08-24 04:05:36.444775',1,7,'1','JO',1,'');
INSERT INTO "django_admin_log" VALUES(2,'2014-08-24 22:24:56.562972',1,7,'2','JO',1,'');
INSERT INTO "django_admin_log" VALUES(3,'2014-08-24 22:39:36.728112',1,7,'3','JO',1,'');
INSERT INTO "django_admin_log" VALUES(4,'2014-08-24 22:47:23.364024',1,7,'3','JO',2,'Changed joke.');
INSERT INTO "django_admin_log" VALUES(5,'2014-08-25 04:49:11.229204',1,7,'4','JO',1,'');
INSERT INTO "django_admin_log" VALUES(6,'2014-08-25 04:51:25.830735',1,7,'5','JO',1,'');
INSERT INTO "django_admin_log" VALUES(7,'2014-08-25 04:52:00.896964',1,7,'6','JO',1,'');
INSERT INTO "django_admin_log" VALUES(8,'2014-08-27 02:59:56.407929',1,7,'7','JO',1,'');
INSERT INTO "django_admin_log" VALUES(9,'2014-08-27 03:01:39.341006',1,7,'8','JO',1,'');
INSERT INTO "django_admin_log" VALUES(10,'2014-08-27 03:04:56.448756',1,7,'9','EN',1,'');
INSERT INTO "django_admin_log" VALUES(11,'2014-08-27 03:05:14.826123',1,7,'10','EN',1,'');
INSERT INTO "django_admin_log" VALUES(12,'2014-08-27 03:05:30.147286',1,7,'11','EN',1,'');
INSERT INTO "django_admin_log" VALUES(13,'2014-08-27 03:05:52.330649',1,7,'12','EN',1,'');
INSERT INTO "django_admin_log" VALUES(14,'2014-08-27 03:06:18.773487',1,7,'13','EN',1,'');
INSERT INTO "django_admin_log" VALUES(15,'2014-08-27 03:07:03.405577',1,7,'14','EN',1,'');
INSERT INTO "django_admin_log" VALUES(16,'2014-08-27 03:07:32.936824',1,7,'15','EN',1,'');
INSERT INTO "django_admin_log" VALUES(17,'2014-08-27 03:08:27.721874',1,7,'16','EN',1,'');
INSERT INTO "django_admin_log" VALUES(18,'2014-08-27 03:08:51.643614',1,7,'17','EN',1,'');
INSERT INTO "django_admin_log" VALUES(19,'2014-08-27 03:10:20.017232',1,7,'18','EN',1,'');
INSERT INTO "django_admin_log" VALUES(20,'2014-08-27 03:11:24.256576',1,7,'19','EN',1,'');
INSERT INTO "django_admin_log" VALUES(21,'2014-08-27 03:11:59.797754',1,7,'19','EN',2,'Changed joke.');
INSERT INTO "django_admin_log" VALUES(22,'2014-08-27 03:13:38.480463',1,7,'20','EN',1,'');
INSERT INTO "django_admin_log" VALUES(23,'2014-08-27 03:14:08.553082',1,7,'21','EN',1,'');
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(5,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(6,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(7,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(8,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(9,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(10,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(11,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add joke',7,'add_joke');
INSERT INTO "auth_permission" VALUES(20,'Can change joke',7,'change_joke');
INSERT INTO "auth_permission" VALUES(21,'Can delete joke',7,'delete_joke');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$12000$cdyO82sEt3Oc$8qSIPPypwUrS2Lx1L/p0eUWxnhQY9qmYMwJS+X4rx+I=','2014-08-27 02:59:03.478877',1,'frank','','','philsophia@gmail.com',1,1,'2014-08-24 03:59:34.376562');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'joke','jokerepo','joke');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('nfvfn4bwv6yrv1iehny4evqtzbhdrvee','YmM2YTg4ZTk1NzEzZDMwMWZhODMzMTE4ZWYyZDdlN2QzN2RiMTY2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-07 04:03:45.602415');
INSERT INTO "django_session" VALUES('rj4gz7ei8n5so3sks7hflwolfsorzf8s','YmM2YTg4ZTk1NzEzZDMwMWZhODMzMTE4ZWYyZDdlN2QzN2RiMTY2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-07 22:24:10.815211');
INSERT INTO "django_session" VALUES('lr02pqa7jaiw79v10n88nvn3bdg8gkuy','YmM2YTg4ZTk1NzEzZDMwMWZhODMzMTE4ZWYyZDdlN2QzN2RiMTY2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-08 04:48:38.087683');
INSERT INTO "django_session" VALUES('x3srg7qpx5rbgfw6cbpvb8tvlg52cns5','YmM2YTg4ZTk1NzEzZDMwMWZhODMzMTE4ZWYyZDdlN2QzN2RiMTY2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-10 02:59:03.487220');
CREATE TABLE "jokerepo_joke" (
    "id" integer NOT NULL PRIMARY KEY,
    "joke" varchar(400) NOT NULL,
    "pub_date" datetime NOT NULL,
    "tag" varchar(3) NOT NULL
);
INSERT INTO "jokerepo_joke" VALUES(1,'What''s new? There is nothing new under the sun. There is only the eternal recurrence of the same','2014-08-23 21:06:00','JO');
INSERT INTO "jokerepo_joke" VALUES(2,'How are you doing? My soul is calm and bright as the mountains in the morning. ','2014-08-24 15:25:23','JO');
INSERT INTO "jokerepo_joke" VALUES(3,'What am I / what are you? I am a railing by the torrent, grasp me those who can. Your crutch however, i am not.','2014-08-24 15:40:03','JO');
INSERT INTO "jokerepo_joke" VALUES(4,'Funny, isn''t it? the number of people who still think Hitler was German','2014-08-24 21:49:37','JO');
INSERT INTO "jokerepo_joke" VALUES(5,'good morning every one, i know it ''s normal in Britain to start with a joke, but I''m German, and as you know, we have no sense of humour','2014-08-24 21:51:51','JO');
INSERT INTO "jokerepo_joke" VALUES(6,'But.... - there are not buts, there is only one butt','2014-08-24 21:52:26','JO');
INSERT INTO "jokerepo_joke" VALUES(7,'phone rings, pick up: "hello this is doug engelbart, inventor of the computer mouse in 1965','2014-08-26 20:00:21','JO');
INSERT INTO "jokerepo_joke" VALUES(8,'How are you? My body fatigued, but my soul untroubled','2014-08-26 20:02:05','JO');
INSERT INTO "jokerepo_joke" VALUES(9,'Pie in the sky - false optimism','2014-08-26 20:05:20','EN');
INSERT INTO "jokerepo_joke" VALUES(10,'sold on - uncritically enthousiastic','2014-08-26 20:05:40','EN');
INSERT INTO "jokerepo_joke" VALUES(11,'sold down the river - deceived','2014-08-26 20:05:55','EN');
INSERT INTO "jokerepo_joke" VALUES(12,'go down the tube - go badly wrong','2014-08-26 20:06:17','EN');
INSERT INTO "jokerepo_joke" VALUES(13,'money for old rope - money earned with little effort','2014-08-26 20:06:44','EN');
INSERT INTO "jokerepo_joke" VALUES(14,'Put your money where your mouth is - take concrete action to support your statements','2014-08-26 20:07:29','EN');
INSERT INTO "jokerepo_joke" VALUES(15,'The big cheese, head honcho - the boss','2014-08-26 20:07:58','EN');
INSERT INTO "jokerepo_joke" VALUES(16,'To get to grips - deal with it','2014-08-26 20:08:53','EN');
INSERT INTO "jokerepo_joke" VALUES(17,'take it from the top - simply start again from beginning','2014-08-26 20:09:17','EN');
INSERT INTO "jokerepo_joke" VALUES(18,'to pull the plug - to end it','2014-08-26 20:10:46','EN');
INSERT INTO "jokerepo_joke" VALUES(19,'couldn''t organize a piss-up (drunken party) in a brewery - someone is incompetent','2014-08-26 20:11:50','EN');
INSERT INTO "jokerepo_joke" VALUES(20,'to go for broke - do everything possible to ensure success','2014-08-26 20:14:02','EN');
INSERT INTO "jokerepo_joke" VALUES(21,'it''s raining cats and dogs','2014-08-26 20:14:34','EN');
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
COMMIT;
