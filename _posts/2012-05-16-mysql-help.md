---
layout: post
title: MySql Help
tags:
- Administration
status: publish
type: post
published: true
meta:
  _encloseme: '1'
  _pingme: '1'
  _edit_last: '1'
  _edit_lock: '1337098952'
---

## Backup and Recovery

Use following command to backup an InnoDB table

    $ mysqldump -u username -p password --default-character-set=utf8 
    --single-transaction db_name table_name > db_name-table_name-backup.sql

If you want to backup the whole database you just omit the table name. And
then use the following command to recover the table.

    $ mysql -u username -p password db_name-table_name-backup.sql
