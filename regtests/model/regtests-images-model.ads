-----------------------------------------------------------------------
--  Regtests.Images.Model -- Regtests.Images.Model
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
with Ada.Calendar;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
pragma Warnings (On);
package Regtests.Images.Model is

   pragma Style_Checks ("-mr");

   type Image_Ref is new ADO.Objects.Object_Ref with null record;

   --  Create an object key for Image.
   function Image_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Image from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Image_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Image : constant Image_Ref;
   function "=" (Left, Right : Image_Ref'Class) return Boolean;

   --  Set the image identifier
   procedure Set_Id (Object : in out Image_Ref;
                     Value  : in ADO.Identifier);

   --  Get the image identifier
   function Get_Id (Object : in Image_Ref)
                 return ADO.Identifier;
   --  Get the image version.
   function Get_Version (Object : in Image_Ref)
                 return Integer;

   --  Set the message creation date
   procedure Set_Create_Date (Object : in out Image_Ref;
                              Value  : in Ada.Calendar.Time);

   --  Get the message creation date
   function Get_Create_Date (Object : in Image_Ref)
                 return Ada.Calendar.Time;

   --  Set the image data
   procedure Set_Image (Object : in out Image_Ref;
                        Value  : in ADO.Blob_Ref);

   --  Get the image data
   function Get_Image (Object : in Image_Ref)
                 return ADO.Blob_Ref;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Image_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Image_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   IMAGE_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Image_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Image_Ref;
                   Into   : in out Image_Ref);

   package Image_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Image_Ref,
                                  "="          => "=");
   subtype Image_Vector is Image_Vectors.Vector;

   procedure List (Object  : in out Image_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);



private
   IMAGE_NAME : aliased constant String := "test_image";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "version";
   COL_2_1_NAME : aliased constant String := "create_date";
   COL_3_1_NAME : aliased constant String := "image";

   IMAGE_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count   => 4,
      Table   => IMAGE_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access,
         3 => COL_2_1_NAME'Access,
         4 => COL_3_1_NAME'Access)
     );
   IMAGE_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := IMAGE_DEF'Access;


   Null_Image : constant Image_Ref
      := Image_Ref'(ADO.Objects.Object_Ref with null record);

   type Image_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => IMAGE_DEF'Access)
   with record
       Version : Integer;
       Create_Date : Ada.Calendar.Time;
       Image : ADO.Blob_Ref;
   end record;

   type Image_Access is access all Image_Impl;

   overriding
   procedure Destroy (Object : access Image_Impl);

   overriding
   procedure Find (Object  : in out Image_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Image_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Image_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Image_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Image_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Image_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Image_Ref'Class;
                        Impl   : out Image_Access);
end Regtests.Images.Model;
