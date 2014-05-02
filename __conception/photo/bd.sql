/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  03/05/2014 01:27:54                      */
/*==============================================================*/

drop database if exists PHOTO;
CREATE DATABASE `photo` /*!40100 DEFAULT CHARACTER SET latin1 */;
use PHOTO;

drop table if exists ACHAT;

drop table if exists ALBUM;

drop table if exists CATEGORIE;

drop table if exists COMMANDE;

drop table if exists COMMENT;

drop table if exists IP;

drop table if exists PHOTO;

drop table if exists PHOTO_ALBUM;

drop table if exists TAG;

drop table if exists USER;

/*==============================================================*/
/* Table : ACHAT                                                */
/*==============================================================*/
create table ACHAT
(
   ID_ACHAT             int not null auto_increment,
   ID_USER              int not null,
   CREATED_AT           datetime not null,
   NB_TELECHARGER       numeric(11,0) not null,
   primary key (ID_ACHAT)
);

/*==============================================================*/
/* Table : ALBUM                                                */
/*==============================================================*/
create table ALBUM
(
   ID                   int not null auto_increment,
   ID_CAT               int not null,
   PRIX                 decimal,
   NB_VUE               numeric(11,0) not null,
   NB_TELECHARGER       numeric(11,0) not null,
   CREATED_AT           datetime not null,
   UPDATED_AT           datetime not null,
   NOM                  char(255) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE
(
   ID_CAT               int not null auto_increment,
   NOM                  char(255) not null,
   POSITION             numeric(3,0) not null,
   primary key (ID_CAT)
);

/*==============================================================*/
/* Table : COMMANDE                                             */
/*==============================================================*/
create table COMMANDE
(
   ID_COMMANDE          int not null auto_increment,
   ID_ACHAT             int not null,
   ID                   int not null,
   primary key (ID_COMMANDE)
);

/*==============================================================*/
/* Table : COMMENT                                              */
/*==============================================================*/
create table COMMENT
(
   ID_COMMENT           int not null auto_increment,
   ID_USER              int not null,
   ID                   int not null,
   TEXTE                text not null,
   NB_VUE               numeric(11,0) not null,
   CREATED_AT           datetime not null,
   UPDATED_AT           datetime not null,
   primary key (ID_COMMENT)
);

/*==============================================================*/
/* Table : IP                                                   */
/*==============================================================*/
create table IP
(
   ID_IP                int not null auto_increment,
   ID_USER              int not null,
   IP                   char(255) not null,
   primary key (ID_IP)
);

/*==============================================================*/
/* Table : PHOTO                                                */
/*==============================================================*/
create table PHOTO
(
   ID                   int not null auto_increment,
   ID_CAT               int not null,
   PRIX                 decimal,
   NB_VUE               numeric(11,0) not null,
   NB_TELECHARGER       numeric(11,0) not null,
   CREATED_AT           datetime not null,
   UPDATED_AT           datetime not null,
   NOM                  char(255) not null,
   URL                  char(255) not null,
   EXT                  char(255) not null,
   WIDTH                char(255) not null,
   HEIGHT               char(255) not null,
   RESOLUTION           char(255) not null,
   SIZE                 char(255) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table : PHOTO_ALBUM                                          */
/*==============================================================*/
create table PHOTO_ALBUM
(
   ALB_ID               int not null,
   ID                   int not null,
   primary key (ALB_ID, ID)
);

/*==============================================================*/
/* Table : TAG                                                  */
/*==============================================================*/
create table TAG
(
   ID_TAGS              int not null auto_increment,
   ID                   int not null,
   NOM                  char(255) not null,
   primary key (ID_TAGS)
);

/*==============================================================*/
/* Table : USER                                                 */
/*==============================================================*/
create table USER
(
   ID_USER              int not null auto_increment,
   USERNAME             char(255) not null,
   EMAIL                char(255) not null,
   NOM                  char(255),
   PRENOM               char(255),
   TEL                  char(255),
   SALT                 char(255) not null,
   PASS                 char(255) not null,
   ROLE                 numeric(3,0) not null,
   CREATED_AT           datetime not null,
   UPDATED_AT           datetime not null,
   LAST_CONNECTED       date not null,
   ACTIVE               bool not null,
   primary key (ID_USER)
);

alter table ACHAT add constraint FK_ACHATS_USER foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table ALBUM add constraint FK_CATEGORIE_PRODUIT2 foreign key (ID_CAT)
      references CATEGORIE (ID_CAT) on delete restrict on update restrict;

alter table COMMANDE add constraint FK_ASSOCIATION_10 foreign key (ID_ACHAT)
      references ACHAT (ID_ACHAT) on delete restrict on update restrict;

alter table COMMANDE add constraint FK_ASSOCIATION_11 foreign key (ID)
      references PHOTO (ID) on delete restrict on update restrict;

alter table COMMANDE add constraint FK_ASSOCIATION_12 foreign key (ID)
      references ALBUM (ID) on delete restrict on update restrict;

alter table COMMENT add constraint FK_COMMENT_USER foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table COMMENT add constraint FK_PRODIUT_COMMENT foreign key (ID)
      references PHOTO (ID) on delete restrict on update restrict;

alter table COMMENT add constraint FK_PRODIUT_COMMENT2 foreign key (ID)
      references ALBUM (ID) on delete restrict on update restrict;

alter table IP add constraint FK_IP_USER foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table PHOTO add constraint FK_CATEGORIE_PRODUIT foreign key (ID_CAT)
      references CATEGORIE (ID_CAT) on delete restrict on update restrict;

alter table PHOTO_ALBUM add constraint FK_PHOTO_ALBUM foreign key (ID)
      references PHOTO (ID) on delete restrict on update restrict;

alter table PHOTO_ALBUM add constraint FK_PHOTO_ALBUM2 foreign key (ALB_ID)
      references ALBUM (ID) on delete restrict on update restrict;

alter table TAG add constraint FK_PROTUIT_TAG foreign key (ID)
      references PHOTO (ID) on delete restrict on update restrict;

alter table TAG add constraint FK_PROTUIT_TAG2 foreign key (ID)
      references ALBUM (ID) on delete restrict on update restrict;

