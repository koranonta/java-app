  UPDATE @@TABLE_NAME@@
     SET DateDeleted = Now()
        ,DeletedBy   = pLoginId
   WHERE @@PRIMARY_KEY@@ = @@KEY_VALUE@@;     