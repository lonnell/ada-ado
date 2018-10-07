-----------------------------------------------------------------------
--  ado-configs -- Database connection configuration
--  Copyright (C) 2010, 2011, 2012, 2016, 2017, 2018 Stephane Carrez
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

with Ada.Finalization;

with Util.Properties;

package ADO.Configs is

   --  Configuration property to control the search paths to load XML queries.
   QUERY_PATHS_CONFIG : constant String := "ado.queries.paths";

   --  Configuration property to control whether all the program XML queries must be
   --  loaded when the database configuration is setup.
   QUERY_LOAD_CONFIG  : constant String := "ado.queries.load";

   --  Raised when the connection URI is invalid.
   Connection_Error : exception;

   --  ------------------------------
   --  The database configuration properties
   --  ------------------------------
   type Configuration is new Ada.Finalization.Controlled with private;
   type Configuration_Access is access all Configuration'Class;

   --  Set the connection URL to connect to the database.
   --  The driver connection is a string of the form:
   --
   --   driver://[host][:port]/[database][?property1][=value1]...
   --
   --  If the string is invalid or if the driver cannot be found,
   --  the Connection_Error exception is raised.
   procedure Set_Connection (Config : in out Configuration;
                             URI    : in String);

   --  Get the connection URI that describes the database connection string.
   --  The returned string may contain connection authentication information.
   function Get_URI (Config : in Configuration) return String;

   --  Get the connection URI that describes the database connection string
   --  but the connection authentication is replaced by XXXX.
   function Get_Log_URI (Config : in Configuration) return String;

   --  Set a property on the datasource for the driver.
   --  The driver can retrieve the property to configure and open
   --  the database connection.
   procedure Set_Property (Config : in out Configuration;
                           Name   : in String;
                           Value  : in String);

   --  Get a property from the data source configuration.
   --  If the property does not exist, an empty string is returned.
   function Get_Property (Config : in Configuration;
                          Name   : in String) return String;

   --  Set the server hostname.
   procedure Set_Server (Config : in out Configuration;
                         Server : in String);

   --  Get the server hostname.
   function Get_Server (Config : in Configuration) return String;

   --  Set the server port.
   procedure Set_Port (Config : in out Configuration;
                       Port   : in Natural);

   --  Get the server port.
   function Get_Port (Config : in Configuration) return Natural;

   --  Set the database name.
   procedure Set_Database (Config   : in out Configuration;
                           Database : in String);

   --  Get the database name.
   function Get_Database (Config : in Configuration) return String;

   --  Get the database driver name.
   function Get_Driver (Config : in Configuration) return String;

   --  Iterate over the configuration properties and execute the given procedure passing the
   --  property name and its value.
   procedure Iterate (Config  : in Configuration;
                      Process : access procedure (Name : in String;
                                                  Item : in Util.Properties.Value));

private

   use Ada.Strings.Unbounded;

   type Configuration is new Ada.Finalization.Controlled with record
      URI        : Unbounded_String;
      Log_URI    : Unbounded_String;
      Driver     : Unbounded_String;
      Server     : Unbounded_String;
      Port       : Natural := 0;
      Database   : Unbounded_String;
      Properties : Util.Properties.Manager;
   end record;

end ADO.Configs;
