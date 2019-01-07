-----------------------------------------------------------------------
--  Regtests.Simple.Model -- Regtests.Simple.Model
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2019 Stephane Carrez
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
pragma Warnings (Off);
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
pragma Warnings (On);
package Regtests.Simple.Model is

   pragma Style_Checks ("-mr");

   type Allocate_Ref is new ADO.Objects.Object_Ref with null record;

   type User_Ref is new ADO.Objects.Object_Ref with null record;

   --  --------------------
   --  Record representing a user
   --  --------------------
   --  Create an object key for Allocate.
   function Allocate_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Allocate from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Allocate_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Allocate : constant Allocate_Ref;
   function "=" (Left, Right : Allocate_Ref'Class) return Boolean;

   --  Set the user id
   procedure Set_Id (Object : in out Allocate_Ref;
                     Value  : in ADO.Identifier);

   --  Get the user id
   function Get_Id (Object : in Allocate_Ref)
                 return ADO.Identifier;
   --  Get the allocate version.
   function Get_Version (Object : in Allocate_Ref)
                 return Integer;

   --  Set the sequence value
   procedure Set_Name (Object : in out Allocate_Ref;
                       Value  : in ADO.Nullable_String);
   procedure Set_Name (Object : in out Allocate_Ref;
                       Value : in String);

   --  Get the sequence value
   function Get_Name (Object : in Allocate_Ref)
                 return ADO.Nullable_String;
   function Get_Name (Object : in Allocate_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Allocate_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Allocate_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   ALLOCATE_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Allocate_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Allocate_Ref;
                   Into   : in out Allocate_Ref);

   package Allocate_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Allocate_Ref,
                                  "="          => "=");
   subtype Allocate_Vector is Allocate_Vectors.Vector;

   procedure List (Object  : in out Allocate_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  --------------------
   --  Record representing a user
   --  --------------------
   --  Create an object key for User.
   function User_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for User from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function User_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_User : constant User_Ref;
   function "=" (Left, Right : User_Ref'Class) return Boolean;

   --  Set the user id
   procedure Set_Id (Object : in out User_Ref;
                     Value  : in ADO.Identifier);

   --  Get the user id
   function Get_Id (Object : in User_Ref)
                 return ADO.Identifier;
   --  Get the comment version.
   function Get_Version (Object : in User_Ref)
                 return Integer;

   --  Set the sequence value
   procedure Set_Value (Object : in out User_Ref;
                        Value  : in ADO.Identifier);

   --  Get the sequence value
   function Get_Value (Object : in User_Ref)
                 return ADO.Identifier;

   --  Set the user name
   procedure Set_Name (Object : in out User_Ref;
                       Value  : in ADO.Nullable_String);
   procedure Set_Name (Object : in out User_Ref;
                       Value : in String);

   --  Get the user name
   function Get_Name (Object : in User_Ref)
                 return ADO.Nullable_String;
   function Get_Name (Object : in User_Ref)
                 return String;

   --  Set the user name
   procedure Set_Select_Name (Object : in out User_Ref;
                              Value  : in ADO.Nullable_String);
   procedure Set_Select_Name (Object : in out User_Ref;
                              Value : in String);

   --  Get the user name
   function Get_Select_Name (Object : in User_Ref)
                 return ADO.Nullable_String;
   function Get_Select_Name (Object : in User_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out User_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in User_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   USER_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out User_Ref);

   --  Copy of the object.
   procedure Copy (Object : in User_Ref;
                   Into   : in out User_Ref);

   package User_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => User_Ref,
                                  "="          => "=");
   subtype User_Vector is User_Vectors.Vector;

   procedure List (Object  : in out User_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);



private
   ALLOCATE_NAME : aliased constant String := "allocate";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "version";
   COL_2_1_NAME : aliased constant String := "name";

   ALLOCATE_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count   => 3,
      Table   => ALLOCATE_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access,
         3 => COL_2_1_NAME'Access)
     );
   ALLOCATE_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := ALLOCATE_DEF'Access;


   Null_Allocate : constant Allocate_Ref
      := Allocate_Ref'(ADO.Objects.Object_Ref with null record);

   type Allocate_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => ALLOCATE_DEF'Access)
   with record
       Version : Integer;
       Name : ADO.Nullable_String;
   end record;

   type Allocate_Access is access all Allocate_Impl;

   overriding
   procedure Destroy (Object : access Allocate_Impl);

   overriding
   procedure Find (Object  : in out Allocate_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Allocate_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Allocate_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Allocate_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Allocate_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Allocate_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Allocate_Ref'Class;
                        Impl   : out Allocate_Access);
   USER_NAME : aliased constant String := "test_user";
   COL_0_2_NAME : aliased constant String := "id";
   COL_1_2_NAME : aliased constant String := "version";
   COL_2_2_NAME : aliased constant String := "value";
   COL_3_2_NAME : aliased constant String := "name";
   COL_4_2_NAME : aliased constant String := "select";

   USER_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count   => 5,
      Table   => USER_NAME'Access,
      Members => (
         1 => COL_0_2_NAME'Access,
         2 => COL_1_2_NAME'Access,
         3 => COL_2_2_NAME'Access,
         4 => COL_3_2_NAME'Access,
         5 => COL_4_2_NAME'Access)
     );
   USER_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := USER_DEF'Access;


   Null_User : constant User_Ref
      := User_Ref'(ADO.Objects.Object_Ref with null record);

   type User_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => USER_DEF'Access)
   with record
       Version : Integer;
       Value : ADO.Identifier;
       Name : ADO.Nullable_String;
       Select_Name : ADO.Nullable_String;
   end record;

   type User_Access is access all User_Impl;

   overriding
   procedure Destroy (Object : access User_Impl);

   overriding
   procedure Find (Object  : in out User_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out User_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out User_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out User_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out User_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out User_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out User_Ref'Class;
                        Impl   : out User_Access);
end Regtests.Simple.Model;
