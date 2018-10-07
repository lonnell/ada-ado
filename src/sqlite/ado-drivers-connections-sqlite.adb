-----------------------------------------------------------------------
--  ADO Sqlite Database -- SQLite Database connections
--  Copyright (C) 2009, 2010, 2011, 2012, 2015, 2017, 2018 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------

with Interfaces.C.Strings;

with Util.Log;
with Util.Log.Loggers;
with Util.Processes.Tools;
with ADO.Sessions;
with ADO.Statements.Sqlite;
with ADO.Schemas.Sqlite;

package body ADO.Drivers.Connections.Sqlite is

   use ADO.Statements.Sqlite;
   use Interfaces.C;

   pragma Linker_Options ("-lsqlite3");

   Log : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("ADO.Databases.Sqlite");

   Driver_Name : aliased constant String := "sqlite";
   Driver      : aliased Sqlite_Driver;

   --  ------------------------------
   --  Get the database driver which manages this connection.
   --  ------------------------------
   overriding
   function Get_Driver (Database : in Database_Connection)
                        return Driver_Access is
      pragma Unreferenced (Database);
   begin
      return Driver'Access;
   end Get_Driver;

   overriding
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Query_Statement_Access is
   begin
      return Create_Statement (Database => Database.Server, Table => Table);
   end Create_Statement;

   overriding
   function Create_Statement (Database : in Database_Connection;
                              Query    : in String)
                              return Query_Statement_Access is
   begin
      return Create_Statement (Database => Database.Server, Query => Query);
   end Create_Statement;

   --  ------------------------------
   --  Create a delete statement.
   --  ------------------------------
   overriding
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Delete_Statement_Access is
   begin
      return Create_Statement (Database => Database.Server, Table => Table);
   end Create_Statement;

   --  ------------------------------
   --  Create an insert statement.
   --  ------------------------------
   overriding
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Insert_Statement_Access is
   begin
      return Create_Statement (Database => Database.Server, Table => Table);
   end Create_Statement;

   --  ------------------------------
   --  Create an update statement.
   --  ------------------------------
   overriding
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Update_Statement_Access is
   begin
      return Create_Statement (Database => Database.Server, Table => Table);
   end Create_Statement;

   --  ------------------------------
   --  Start a transaction.
   --  ------------------------------
   procedure Begin_Transaction (Database : in out Database_Connection) is
   begin
      if Database.Server = null then
         raise ADO.Sessions.Session_Error with "Database connection is closed";
      end if;
   end Begin_Transaction;

   --  ------------------------------
   --  Commit the current transaction.
   --  ------------------------------
   procedure Commit (Database : in out Database_Connection) is
   begin
      if Database.Server = null then
         raise ADO.Sessions.Session_Error with "Database connection is closed";
      end if;
   end Commit;

   --  ------------------------------
   --  Rollback the current transaction.
   --  ------------------------------
   procedure Rollback (Database : in out Database_Connection) is
   begin
      if Database.Server = null then
         raise ADO.Sessions.Session_Error with "Database connection is closed";
      end if;
   end Rollback;

   --  ------------------------------
   --  Closes the database connection
   --  ------------------------------
   overriding
   procedure Close (Database : in out Database_Connection) is
      Result : int;
   begin
      Log.Info ("Close connection {0}", Database.Name);

      if Database.Server /= null then
         Result := Sqlite3_H.sqlite3_close_v2 (Database.Server);
         if Result /= Sqlite3_H.SQLITE_OK then
            declare
               Error : constant Strings.chars_ptr := Sqlite3_H.sqlite3_errstr (Result);
               Msg   : constant String := Strings.Value (Error);
            begin
               Log.Error ("Cannot close database {0}: {1}", To_String (Database.Name), Msg);
            end;
         end if;
         Database.Server := null;
      end if;
   end Close;

   --  ------------------------------
   --  Releases the sqlite connection if it is open
   --  ------------------------------
   overriding
   procedure Finalize (Database : in out Database_Connection) is
   begin
      Log.Debug ("Release database connection");

      if Database.Server /= null then
         Database.Close;
      end if;
   end Finalize;

   --  ------------------------------
   --  Load the database schema definition for the current database.
   --  ------------------------------
   overriding
   procedure Load_Schema (Database : in Database_Connection;
                          Schema   : out ADO.Schemas.Schema_Definition) is
   begin
      ADO.Schemas.Sqlite.Load_Schema (Database, Schema);
   end Load_Schema;

   --  ------------------------------
   --  Create the database and initialize it with the schema SQL file.
   --  ------------------------------
   procedure Create_Database (Database    : in Database_Connection;
                              Config      : in Configs.Configuration'Class;
                              Schema_Path : in String;
                              Messages    : out Util.Strings.Vectors.Vector) is
      pragma Unreferenced (Database);

      Status        : Integer;
      Database_Path : constant String := Config.Get_Database;
      Command       : constant String :=
        "sqlite3 --batch --init " & Schema_Path & " " & Database_Path;
   begin
      Log.Info ("Creating SQLite database {0}", Database_Path);
      Messages.Clear;
      Util.Processes.Tools.Execute (Command, Messages, Status);

      if Status = 0 then
         Log.Info ("Database schema created successfully.");
      elsif Status = 255 then
         Messages.Append ("Command not found: " & Command);
         Log.Error ("Command not found: {0}", Command);
      else
         Log.Error ("Command {0} failed with exit code {1}", Command,
                    Util.Strings.Image (Status));
      end if;
   end Create_Database;

   --  ------------------------------
   --  Initialize the database connection manager.
   --  ------------------------------
   procedure Create_Connection (D      : in out Sqlite_Driver;
                                Config : in Configuration'Class;
                                Result : in out Ref.Ref'Class) is
      pragma Unreferenced (D);
      use Strings;

      Name     : constant String := Config.Get_Database;
      Filename : Strings.chars_ptr;
      Status   : int;
      Handle   : aliased access Sqlite3;
      Flags    : constant int := Sqlite3_H.SQLITE_OPEN_FULLMUTEX + Sqlite3_H.SQLITE_OPEN_READWRITE;
   begin
      Log.Info ("Opening database {0}", Name);

      Filename := Strings.New_String (Name);
      Status := Sqlite3_H.sqlite3_open_v2 (Filename, Handle'Address,
                                           Flags,
                                           Strings.Null_Ptr);

      Strings.Free (Filename);
      if Status /= Sqlite3_H.SQLITE_OK then
         declare
            Error : constant Strings.chars_ptr := Sqlite3_H.sqlite3_errstr (Status);
            Msg   : constant String := Strings.Value (Error);
         begin
            Log.Error ("Cannot open SQLite database: {0}", Msg);
            raise ADO.Configs.Connection_Error with "Cannot open database: " & Msg;
         end;
      end if;

      declare
         Database : constant Database_Connection_Access := new Database_Connection;

         procedure Configure (Name : in String;
                              Item : in Util.Properties.Value);
         function Escape (Value : in Util.Properties.Value) return String;

         function Escape (Value : in Util.Properties.Value) return String is
            S : constant String := Util.Properties.To_String (Value);
         begin
            if S'Length > 0 and then S (S'First) >= '0' and then S (S'First) <= '9' then
               return S;
            elsif S'Length > 0 and then S (S'First) = ''' then
               return S;
            else
               return "'" & S & "'";
            end if;
         end Escape;

         procedure Configure (Name : in String;
                              Item : in Util.Properties.Value) is
            SQL : constant String := "PRAGMA " & Name & "=" & Escape (Item);
         begin
            if Util.Strings.Index (Name, '.') = 0 then
               Log.Info ("Configure database with {0}", SQL);
               ADO.Statements.Sqlite.Execute (Database.Server, SQL);
            end if;

         exception
            when SQL_Error =>
               null;
         end Configure;

      begin
         Database.Server := Handle;
         Database.Name   := To_Unbounded_String (Config.Get_Database);
         Result := Ref.Create (Database.all'Access);

         --  Configure the connection by setting up the SQLite 'pragma X=Y' SQL commands.
         --  Typical configuration includes:
         --    synchronous=OFF
         --    temp_store=MEMORY
         --    encoding='UTF-8'
         Config.Iterate (Process => Configure'Access);
      end;
   end Create_Connection;

   --  ------------------------------
   --  Initialize the SQLite driver.
   --  ------------------------------
   procedure Initialize is
      use type Util.Strings.Name_Access;
   begin
      Log.Debug ("Initializing sqlite driver");

      if Driver.Name = null then
         Driver.Name := Driver_Name'Access;
         Register (Driver'Access);
      end if;
   end Initialize;

end ADO.Drivers.Connections.Sqlite;
